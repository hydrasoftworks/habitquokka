import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_markdown/flutter_markdown.dart';

import 'package:habitquokka/widgets/panel_container.dart';

class MarkdownPage extends StatelessWidget {
  const MarkdownPage({
    super.key,
    required this.padding,
    required this.asset,
  });

  final EdgeInsets padding;
  final String asset;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PanelContainer(
        padding: padding,
        child: FutureBuilder(
          future: rootBundle.loadString(asset),
          builder: (context, snapshot) {
            final data = snapshot.data;
            if (snapshot.hasData && data != null) {
              return Markdown(data: data);
            } else {
              return const CircularProgressIndicator();
            }
          },
        ),
      ),
    );
  }
}
