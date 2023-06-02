import 'package:flutter/material.dart';

class AppColors extends ThemeExtension<AppColors> {
  const AppColors({
    this.main = AppColors.initial,
  });

  final Color main;

  static const Color initial = Color(0xFFABD2FF);

  @override
  AppColors copyWith({
    Color? main,
  }) {
    return AppColors(
      main: main ?? this.main,
    );
  }

  @override
  AppColors lerp(AppColors? other, double t) {
    if (other is! AppColors) return this;
    return copyWith(
      main: Color.lerp(main, other.main, t),
    );
  }
}
