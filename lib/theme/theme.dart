import 'package:flutter/material.dart';

import 'package:habitquokka/theme/colors.dart';
import 'package:habitquokka/theme/spacing.dart';

export 'package:habitquokka/theme/colors.dart';
export 'package:habitquokka/theme/spacing.dart';

extension AppThemeExtensions on ThemeExtension {
  static List<ThemeExtension> get app => const [
        AppColors(),
        AppSpacing(),
      ];
}

extension GetAppThemeExtensions on ThemeData {
  AppColors get appColors =>
      extension<AppColors>() ?? (throw _extensionNotRegistered);

  AppSpacing get appSpacing =>
      extension<AppSpacing>() ?? (throw _extensionNotRegistered);

  ArgumentError get _extensionNotRegistered => ArgumentError(
        'Extension must be registered in themeExtensions list',
      );
}