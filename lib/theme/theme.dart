import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

import 'package:habitquokka/theme/colors.dart';
import 'package:habitquokka/theme/size.dart';
import 'package:habitquokka/theme/spacing.dart';

export 'package:habitquokka/theme/colors.dart';
export 'package:habitquokka/theme/spacing.dart';

extension AppThemeExtensions on ThemeExtension {
  static List<ThemeExtension> get app => const [
        AppColors(),
        AppSpacing(),
        AppSize(),
      ];
}

extension GetAppThemeExtensions on ThemeData {
  AppColors get appColors =>
      extension<AppColors>() ?? (throw _extensionNotRegistered);

  AppSpacing get appSpacing =>
      extension<AppSpacing>() ?? (throw _extensionNotRegistered);

  AppSize get appSize =>
      extension<AppSize>() ?? (throw _extensionNotRegistered);

  ArgumentError get _extensionNotRegistered => ArgumentError(
        'Extension must be registered in themeExtensions list',
      );
}

extension EnhanceTheme on ThemeData {
  ThemeData get enhanced => copyWith(
        textTheme: GoogleFonts.notoSansTextTheme(textTheme),
        extensions: AppThemeExtensions.app,
        inputDecorationTheme: InputDecorationTheme(
          floatingLabelBehavior: FloatingLabelBehavior.always,
          border: const OutlineInputBorder(),
          hintStyle: TextStyle(color: hintColor.withOpacity(0.3)),
        ),
      );
}
