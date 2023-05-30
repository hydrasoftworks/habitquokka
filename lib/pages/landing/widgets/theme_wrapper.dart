import 'package:flutter/material.dart';

class ThemeWrapper extends StatelessWidget {
  const ThemeWrapper({
    super.key,
    required this.seedColor,
    required this.child,
  });

  final Color seedColor;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData.from(
        colorScheme: ColorScheme.fromSeed(
          seedColor: seedColor,
          brightness: Theme.of(context).colorScheme.brightness,
        ),
        textTheme: Theme.of(context).textTheme,
        useMaterial3: true,
      ),
      child: child,
    );
  }
}
