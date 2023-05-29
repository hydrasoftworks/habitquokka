import 'package:flutter/material.dart';

class NextPageButton extends StatelessWidget {
  const NextPageButton({
    super.key,
    required this.onPressed,
  });

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return _ChangePageButton(
      onPressed: onPressed,
      mode: _Mode.next,
    );
  }
}

class PreviousPageButton extends StatelessWidget {
  const PreviousPageButton({
    super.key,
    required this.onPressed,
  });

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return _ChangePageButton(
      onPressed: onPressed,
      mode: _Mode.previous,
    );
  }
}

enum _Mode {
  next,
  previous,
}

class _ChangePageButton extends StatelessWidget {
  const _ChangePageButton({
    required this.onPressed,
    required this.mode,
  });

  final VoidCallback onPressed;
  final _Mode mode;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return IconButton.filled(
      onPressed: onPressed,
      iconSize: width * 0.05,
      style: IconButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top:
                mode == _Mode.next ? Radius.circular(width * 0.1) : Radius.zero,
            bottom: mode == _Mode.previous
                ? Radius.circular(width * 0.1)
                : Radius.zero,
          ),
        ),
      ),
      icon: Icon(
        switch (mode) {
          _Mode.next => Icons.keyboard_arrow_down,
          _Mode.previous => Icons.keyboard_arrow_up,
        },
      ),
    );
  }
}
