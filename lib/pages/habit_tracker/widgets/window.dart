import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class Window extends StatelessWidget {
  const Window({
    super.key,
    required this.text,
    required this.isOpened,
    required this.onPressed,
  });

  final String text;
  final bool isOpened;
  final VoidCallback onPressed;

  static final AutoSizeGroup _autoSizeGroup = AutoSizeGroup();

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: onPressed,
      style: _buildButtonStyle(context, isOpened: isOpened),
      child: AutoSizeText(
        text,
        maxLines: 1,
        minFontSize: 10,
        group: _autoSizeGroup,
      ),
    );
  }

  ButtonStyle _buildButtonStyle(
    BuildContext context, {
    required bool isOpened,
  }) {
    return FilledButton.styleFrom(
      backgroundColor: Theme.of(context)
          .colorScheme
          .primaryContainer
          .withOpacity(isOpened ? 0 : 1),
      foregroundColor: Theme.of(context)
          .colorScheme
          .onPrimaryContainer
          .withOpacity(isOpened ? 0 : 1),
      textStyle: Theme.of(context).textTheme.displayMedium,
      shape: const BeveledRectangleBorder(),
      elevation: 0,
    );
  }
}
