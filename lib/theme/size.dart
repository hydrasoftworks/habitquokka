import 'dart:ui';

import 'package:flutter/material.dart';

class AppSize extends ThemeExtension<AppSize> {
  const AppSize({
    this.modalWidth = 500,
  });

  final double modalWidth;

  @override
  AppSize copyWith({
    double? modalWidth,
  }) {
    return AppSize(
      modalWidth: modalWidth ?? this.modalWidth,
    );
  }

  @override
  AppSize lerp(AppSize? other, double t) {
    if (other is! AppSize) return this;
    return copyWith(
      modalWidth: lerpDouble(modalWidth, other.modalWidth, t),
    );
  }
}
