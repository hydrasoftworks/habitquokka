import 'package:flutter/material.dart';

import 'package:animated_emoji/animated_emoji.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:google_fonts/google_fonts.dart';

class Window extends StatefulWidget {
  const Window({
    super.key,
    required this.text,
    required this.emoji,
    required this.isOpened,
    required this.isHighlighted,
    required this.onPressed,
  });

  final String text;
  final AnimatedEmojiData? emoji;
  final bool isOpened;
  final bool isHighlighted;
  final VoidCallback onPressed;

  static final AutoSizeGroup _autoSizeGroup = AutoSizeGroup();

  @override
  State<Window> createState() => _WindowState();
}

class _WindowState extends State<Window> {
  bool _isLoaded = false;
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onHover: (value) => setState(() => _isHovered = value),
      onPressed: widget.onPressed,
      style: _buildButtonStyle(
        context,
        isOpened: widget.isOpened,
        isHighlighted: widget.isHighlighted,
      ),
      child: _buildContent(context),
    );
  }

  Widget _buildContent(BuildContext context) {
    if (widget.isOpened) return const SizedBox();

    final emoji = widget.emoji;

    return Stack(
      fit: StackFit.expand,
      children: [
        AutoSizeText(
          widget.text,
          maxLines: 1,
          minFontSize: 10,
          group: Window._autoSizeGroup,
        ),
        if (emoji != null)
          _ImagePlacement(
            child: AnimatedEmoji(
              emoji,
              animate: _isHovered,
              source: AnimatedEmojiSource.network,
              onLoaded: (_) => setState(() => _isLoaded = true),
            ),
          ),
        if (emoji != null && !_isLoaded)
          const _ImagePlacement(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          ),
      ],
    );
  }

  ButtonStyle _buildButtonStyle(
    BuildContext context, {
    required bool isOpened,
    required bool isHighlighted,
  }) {
    final foregroundColor = isHighlighted
        ? Theme.of(context).colorScheme.onPrimaryContainer
        : Theme.of(context).colorScheme.primary;

    return FilledButton.styleFrom(
      backgroundColor: Theme.of(context)
          .colorScheme
          .primaryContainer
          .withOpacity(isOpened ? 0 : 1),
      foregroundColor: foregroundColor.withOpacity(isOpened ? 0 : 1),
      textStyle: GoogleFonts.lilitaOne(
        textStyle: Theme.of(context).textTheme.displayLarge,
      ),
      shape: BeveledRectangleBorder(
        side: isOpened
            ? BorderSide.none
            : BorderSide(color: Theme.of(context).colorScheme.tertiary),
      ),
      elevation: 0,
      padding: const EdgeInsets.all(8),
    );
  }
}

class _ImagePlacement extends StatelessWidget {
  const _ImagePlacement({
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomRight,
      child: FractionallySizedBox(
        widthFactor: 0.7,
        heightFactor: 0.7,
        child: child,
      ),
    );
  }
}
