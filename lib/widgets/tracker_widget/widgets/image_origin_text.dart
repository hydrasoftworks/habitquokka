import 'package:flutter/material.dart';

import 'package:url_launcher/url_launcher.dart';

import 'package:habitquokka/l10n/l10n.dart';
import 'package:habitquokka/models/tracker_image.dart';
import 'package:habitquokka/widgets/inline_span_button.dart';

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

  static const String _appName = String.fromEnvironment('UNSPLASH_APP_NAME');

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        text: L10n.of(context).trackerDetailsPageAuthorLabelPart1,
        children: <InlineSpan>[
          inlineSpanButton(
            label: image.author,
            onPressed: () => _launchUrl(
              '${image.authorUrl}?utm_source=$_appName&utm_medium=referral',
            ),
          ),
          TextSpan(
            text: L10n.of(context).trackerDetailsPageAuthorLabelPart2,
          ),
          inlineSpanButton(
            label: 'Unsplash',
            onPressed: () => _launchUrl(
              'https://unsplash.com/?utm_source=$_appName&utm_medium=referral',
            ),
          ),
        ],
      ),
      style: Theme.of(context).textTheme.bodyMedium,
    );
  }

  Future<void> _launchUrl(String url) async {
    final Uri uri = Uri.parse(url);

    if (!await launchUrl(uri)) {
      throw Exception('Could not launch $uri');
    }
  }
}
