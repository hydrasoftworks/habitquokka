import 'package:flutter/material.dart';

import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'package:habitquokka/l10n/l10n.dart';
import 'package:habitquokka/router.dart';
import 'package:habitquokka/theme/theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return AdaptiveTheme(
      initial: AdaptiveThemeMode.system,
      light: ThemeData.from(
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.initial,
          brightness: Brightness.light,
        ),
        useMaterial3: true,
      ),
      dark: ThemeData.from(
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.initial,
          brightness: Brightness.dark,
        ),
        useMaterial3: true,
      ),
      builder: (light, dark) => ResponsiveApp(
        builder: (context) => MaterialApp.router(
          theme: light.copyWith(
            textTheme: GoogleFonts.notoSansTextTheme(light.textTheme),
            extensions: AppThemeExtensions.app,
          ),
          darkTheme: dark.copyWith(
            textTheme: GoogleFonts.notoSansTextTheme(dark.textTheme),
            extensions: AppThemeExtensions.app,
          ),
          localizationsDelegates: L10n.localizationsDelegates,
          supportedLocales: L10n.supportedLocales,
          onGenerateTitle: (context) => L10n.of(context).appNameLong,
          routerConfig: AppRouter.router,
        ),
      ),
    );
  }
}
