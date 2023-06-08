import 'package:flutter/material.dart';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:habitquokka/l10n/l10n.dart';
import 'package:habitquokka/models/tracker_image.dart';

class ImageOriginText extends StatelessWidget {
  const ImageOriginText({
    super.key,
    required this.image,
  });

  final TrackerImage image;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 8),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface.withOpacity(0.9),
        borderRadius: const BorderRadius.only(topLeft: Radius.circular(4)),
      ),
      child: switch (image.source) {
        ImageSource.unsplash => _UnsplashImageOriginText(image: image)
      },
    );
  }
}

class _UnsplashImageOriginText extends StatelessWidget {
  const _UnsplashImageOriginText({
    required this.image,
  });

  final TrackerImage image;

  String get _appName => dotenv.get('UNSPLASH_APP_NAME');

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        text: L10n.of(context).trackerDetailsPageAuthorLabelPart1,
        children: <InlineSpan>[
          WidgetSpan(
            alignment: PlaceholderAlignment.baseline,
            baseline: TextBaseline.alphabetic,
            child: _LinkButton(
              urlLabel: image.author,
              url: '${image.pageUrl}?utm_source=$_appName&utm_medium=referral',
            ),
          ),
          TextSpan(
            text: L10n.of(context).trackerDetailsPageAuthorLabelPart2,
          ),
          WidgetSpan(
            alignment: PlaceholderAlignment.baseline,
            baseline: TextBaseline.alphabetic,
            child: _LinkButton(
              urlLabel: 'Unsplash',
              url:
                  'https://unsplash.com/?utm_source=$_appName&utm_medium=referral',
            ),
          ),
        ],
      ),
      style: Theme.of(context).textTheme.bodyMedium,
    );
  }
}

class _LinkButton extends StatelessWidget {
  const _LinkButton({
    required this.urlLabel,
    required this.url,
  });

  final String urlLabel;
  final String url;

  Future<void> _launchUrl(String url) async {
    final Uri uri = Uri.parse(url);

    if (!await launchUrl(uri)) {
      throw 'Could not launch $uri';
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => _launchUrl(url),
      style: TextButton.styleFrom(
        padding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(2),
        ),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        visualDensity: VisualDensity.compact,
        minimumSize: Size.zero,
        textStyle: Theme.of(context).textTheme.bodyMedium,
      ),
      child: Text(urlLabel),
    );
  }
}
