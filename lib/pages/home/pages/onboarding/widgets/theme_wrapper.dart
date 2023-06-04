import 'package:flutter/material.dart';

import 'package:habitquokka/theme/theme.dart';

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
      ).copyWith(extensions: AppThemeExtensions.app),
      child: child,
    );
  }
}
