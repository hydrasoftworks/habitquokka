import 'package:flutter/material.dart';

import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:go_router/go_router.dart';

import 'package:habit_quokka/models/destination.dart';
import 'package:habit_quokka/pages/home/home.dart';
import 'package:habit_quokka/pages/trackers/trackers.dart';

final _router = GoRouter(
  initialLocation: '/',
  debugLogDiagnostics: true,
  routes: [
    ShellRoute(
      builder: (context, state, child) => HomePage(child: child),
      routes: <RouteBase>[
        GoRoute(
          path: Destination.home.path,
          builder: (BuildContext context, GoRouterState state) {
            return const Center(child: Text('Home'));
          },
        ),
        GoRoute(
          path: Destination.trackers.path,
          builder: (BuildContext context, GoRouterState state) {
            return const TrackersPage();
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
      builder: (light, dark) => MaterialApp.router(
        title: 'Habit Quokka',
        theme: light,
        darkTheme: dark,
        routerConfig: _router,
      ),
    );
  }
}
