import 'package:flutter/material.dart';

import 'package:animated_emoji/animated_emoji.dart';

class EmptyPage extends StatelessWidget {
  const EmptyPage({
    super.key,
    required this.emoji,
    required this.text,
  });

  final AnimatedEmojiData emoji;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          AnimatedEmoji(emoji, size: 80),
          const SizedBox(height: 20),
          Text(
            text,
            style: Theme.of(context).textTheme.titleLarge,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 80),
        ],
      ),
    );
  }
}
