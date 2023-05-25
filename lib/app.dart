import 'package:flutter/material.dart';

import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'package:habitquokka/models/destination.dart';
import 'package:habitquokka/pages/home/home.dart';
import 'package:habitquokka/pages/trackers/trackers.dart';

final _router = GoRouter(
  initialLocation: '/',
  debugLogDiagnostics: true,
  routes: [
    ShellRoute(
      pageBuilder: (context, state, child) => NoTransitionPage<void>(
        key: state.pageKey,
        child: HomePage(child: child),
      ),
      routes: <RouteBase>[
        GoRoute(
          path: Destination.home.path,
          builder: (BuildContext context, GoRouterState state) {
            return const Center(child: Text('Home'));
          },
        ),
        GoRoute(
          path: Destination.trackers.path,
          pageBuilder: (BuildContext context, GoRouterState state) {
            return NoTransitionPage<void>(
              key: state.pageKey,
              child: const TrackersPage(selectedTrackerId: null),
            );
          },
        ),
        GoRoute(
          path: '${Destination.trackers.path}/:trackerId',
          pageBuilder: (BuildContext context, GoRouterState state) {
            return NoTransitionPage<void>(
              key: state.pageKey,
              child: TrackersPage(
                selectedTrackerId: state.pathParameters['trackerId'],
              ),
            );
          },
        ),
      ],
    ),
  ],
);

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
          routerConfig: _router,
        ),
      ),
    );
  }
}
