import 'package:flutter/material.dart';

import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'package:habitquokka/router.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return AdaptiveTheme(
      initial: AdaptiveThemeMode.system,
      light: ThemeData.light(useMaterial3: true),
      dark: ThemeData.dark(useMaterial3: true),
      builder: (light, dark) => ResponsiveApp(
        builder: (context) => MaterialApp.router(
          title: 'Habit Quokka',
          theme: light.copyWith(
            textTheme: GoogleFonts.notoSansTextTheme(light.textTheme),
          ),
          darkTheme: dark.copyWith(
            textTheme: GoogleFonts.notoSansTextTheme(dark.textTheme),
          ),
          routerConfig: AppRouter.router,
        ),
      ),
    );
  }
}
