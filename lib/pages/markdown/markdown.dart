import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:habitquokka/widgets/panel_container.dart';

class MarkdownPage extends StatelessWidget {
  const MarkdownPage({
    super.key,
    this.padding = PanelContainer.defaultPadding,
    required this.title,
    required this.asset,
    required this.onBackPressed,
  });

  final EdgeInsets padding;
  final String? title;
  final String asset;
  final VoidCallback onBackPressed;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title ?? ''),
        leading: BackButton(onPressed: onBackPressed),
      ),
      body: PanelContainer(
        padding: padding.copyWith(top: 0),
        child: FutureBuilder(
          future: rootBundle.loadString(asset),
          builder: (context, snapshot) {
            final data = snapshot.data;
            if (snapshot.hasData && data != null) {
              return Markdown(
                onTapLink: (text, href, title) {
                  if (href == null) return;
                  launchUrl(Uri.parse(href));
                },
                data: data,
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}
