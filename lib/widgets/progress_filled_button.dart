import 'package:flutter/material.dart';

class ProgressFilledButton extends StatefulWidget {
  const ProgressFilledButton({
    super.key,
    required this.label,
    required this.onPressed,
  });

  final String label;
  final Future<void> Function() onPressed;

  @override
  State<ProgressFilledButton> createState() => _ProgressFilledButtonState();
}

class _ProgressFilledButtonState extends State<ProgressFilledButton> {
  bool _isInIdle = true;

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: _isInIdle
          ? () async {
              setState(() => _isInIdle = false);
              await widget.onPressed();
              setState(() => _isInIdle = true);
            }
          : null,
      child: _isInIdle
          ? Text(widget.label)
          : const SizedBox(
              height: 18,
              width: 18,
              child: CircularProgressIndicator(),
            ),
    );
  }
}
