import 'package:flutter/material.dart';

class ProgressButton extends StatefulWidget {
  const ProgressButton({
    super.key,
    required this.label,
    this.foregroundColor,
    this.backgroundColor,
    required this.onPressed,
  });

  final String label;
  final Color? foregroundColor;
  final Color? backgroundColor;
  final Future<void> Function() onPressed;

  @override
  State<ProgressButton> createState() => _ProgressButtonState();
}

class _ProgressButtonState extends State<ProgressButton> {
  bool _isInIdle = true;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: _isInIdle
          ? () async {
              setState(() => _isInIdle = false);
              await widget.onPressed();
              setState(() => _isInIdle = true);
            }
          : null,
      style: TextButton.styleFrom(
        backgroundColor:
            widget.backgroundColor ?? Theme.of(context).colorScheme.primary,
        foregroundColor:
            widget.foregroundColor ?? Theme.of(context).colorScheme.onPrimary,
      ),
      child: _isInIdle
          ? Text(widget.label)
          : SizedBox(
              height: 18,
              width: 18,
              child: CircularProgressIndicator(
                color: Theme.of(context).colorScheme.onPrimary,
              ),
            ),
    );
  }
}
