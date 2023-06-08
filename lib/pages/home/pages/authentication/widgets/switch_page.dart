import 'package:flutter/material.dart';

class SwitchPage extends StatelessWidget {
  const SwitchPage({
    super.key,
    required this.labelText,
    required this.buttonText,
    required this.onPressed,
  });

  final String labelText;
  final String buttonText;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        text: labelText,
        children: <InlineSpan>[
          WidgetSpan(
            alignment: PlaceholderAlignment.baseline,
            baseline: TextBaseline.alphabetic,
            child: _ActionButton(
              label: buttonText,
              onPressed: onPressed,
            ),
          ),
        ],
      ),
      style: Theme.of(context).textTheme.bodyMedium,
    );
  }
}

class _ActionButton extends StatelessWidget {
  const _ActionButton({
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
