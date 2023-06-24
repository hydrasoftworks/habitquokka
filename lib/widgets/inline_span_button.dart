import 'package:flutter/material.dart';

InlineSpan inlineSpanButton({
  required String label,
  required VoidCallback onPressed,
}) {
  return WidgetSpan(
    alignment: PlaceholderAlignment.baseline,
    baseline: TextBaseline.alphabetic,
    child: _InlineSpanButton(
      label: label,
      onPressed: onPressed,
    ),
  );
}

class _InlineSpanButton extends StatelessWidget {
  const _InlineSpanButton({
    required this.label,
    required this.onPressed,
  });

  final String label;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
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
      child: Text(label),
    );
  }
}
