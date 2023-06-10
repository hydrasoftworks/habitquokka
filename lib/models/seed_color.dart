// Class based on https://github.com/flutter/flutter/blob/master/packages/flutter/lib/src/material/color_scheme.dart

import 'dart:async';
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:material_color_utilities/material_color_utilities.dart';

import 'package:flutter/widgets.dart'
    show
        Canvas,
        FilterQuality,
        ImageConfiguration,
        ImageInfo,
        ImageProvider,
        ImageStream,
        ImageStreamListener,
        paintImage;

Future<ui.Color> seedColorFromImageProvider(ImageProvider provider) async {
  final QuantizerResult quantizerResult =
      await _extractColorsFromImageProvider(provider);
  final Map<int, int> colorToCount = quantizerResult.colorToCount.map(
    (int key, int value) => MapEntry<int, int>(_getArgbFromAbgr(key), value),
  );

  // Score colors for color scheme suitability.
  final List<int> scoredResults = Score.score(colorToCount, desired: 1);
  return ui.Color(scoredResults.first);
}

// ColorScheme.fromImageProvider() utilities.

// Extracts bytes from an [ImageProvider] and returns a [QuantizerResult]
// containing the most dominant colors.
Future<QuantizerResult> _extractColorsFromImageProvider(
  ImageProvider imageProvider,
) async {
  final ui.Image scaledImage = await _imageProviderToScaled(imageProvider);
  final ByteData? imageBytes = await scaledImage.toByteData();

  final QuantizerResult quantizerResult = await QuantizerCelebi().quantize(
    imageBytes!.buffer.asUint32List(),
    128,
    returnInputPixelToClusterPixel: true,
  );
  return quantizerResult;
}

// Scale image size down to reduce computation time of color extraction.
Future<ui.Image> _imageProviderToScaled(ImageProvider imageProvider) async {
  const double maxDimension = 112.0;
  final ImageStream stream = imageProvider.resolve(
      const ImageConfiguration(size: ui.Size(maxDimension, maxDimension)));
  final Completer<ui.Image> imageCompleter = Completer<ui.Image>();
  late ImageStreamListener listener;
  late ui.Image scaledImage;
  Timer? loadFailureTimeout;

  listener = ImageStreamListener((ImageInfo info, bool sync) async {
    loadFailureTimeout?.cancel();
    stream.removeListener(listener);
    final ui.Image image = info.image;
    final int width = image.width;
    final int height = image.height;
    double paintWidth = width.toDouble();
    double paintHeight = height.toDouble();
    assert(width > 0 && height > 0);

    final bool rescale = width > maxDimension || height > maxDimension;
    if (rescale) {
      paintWidth =
          (width > height) ? maxDimension : (maxDimension / height) * width;
      paintHeight =
          (height > width) ? maxDimension : (maxDimension / width) * height;
    }
    final ui.PictureRecorder pictureRecorder = ui.PictureRecorder();
    final Canvas canvas = Canvas(pictureRecorder);
    paintImage(
        canvas: canvas,
        rect: ui.Rect.fromLTRB(0, 0, paintWidth, paintHeight),
        image: image,
        filterQuality: FilterQuality.none);

    final ui.Picture picture = pictureRecorder.endRecording();
    scaledImage =
        await picture.toImage(paintWidth.toInt(), paintHeight.toInt());
    imageCompleter.complete(info.image);
  }, onError: (Object exception, StackTrace? stackTrace) {
    stream.removeListener(listener);
    throw Exception('Failed to render image: $exception');
  });

  loadFailureTimeout = Timer(const Duration(seconds: 5), () {
    stream.removeListener(listener);
    imageCompleter.completeError(
        TimeoutException('Timeout occurred trying to load image'));
  });

  stream.addListener(listener);
  await imageCompleter.future;
  return scaledImage;
}

// Converts AABBGGRR color int to AARRGGBB format.
int _getArgbFromAbgr(int abgr) {
  const int exceptRMask = 0xFF00FFFF;
  const int onlyRMask = ~exceptRMask;
  const int exceptBMask = 0xFFFFFF00;
  const int onlyBMask = ~exceptBMask;
  final int r = (abgr & onlyRMask) >> 16;
  final int b = abgr & onlyBMask;
  return (abgr & exceptRMask & exceptBMask) | (b << 16) | r;
}
