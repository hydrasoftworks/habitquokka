import 'dart:ui';

import 'package:flutter/material.dart';

class AppSpacing extends ThemeExtension<AppSpacing> {
  const AppSpacing({
    this.small = initialSmall,
    this.medium = initialMedium,
    this.large = initialLarge,
  });

  final double small;
  final double medium;
  final double large;

  static const double initialSmall = 12;
  static const double initialMedium = 24;
  static const double initialLarge = 48;

  @override
  AppSpacing copyWith({
    double? small,
    double? medium,
    double? large,
  }) {
    return AppSpacing(
      small: small ?? this.small,
      medium: medium ?? this.medium,
      large: large ?? this.large,
    );
  }

  @override
  AppSpacing lerp(AppSpacing? other, double t) {
    if (other is! AppSpacing) return this;
    return copyWith(
      small: lerpDouble(small, other.small, t),
      medium: lerpDouble(medium, other.medium, t),
      large: lerpDouble(large, other.large, t),
    );
  }
}
