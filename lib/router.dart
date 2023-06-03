import 'package:flutter/material.dart';

import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:go_router/go_router.dart';

import 'package:habitquokka/l10n/l10n.dart';
import 'package:habitquokka/models/emoji.dart';
import 'package:habitquokka/models/home_destination.dart';
import 'package:habitquokka/pages/empty/empty.dart';
import 'package:habitquokka/pages/home/home.dart';
import 'package:habitquokka/pages/onboarding/onboarding.dart';
import 'package:habitquokka/pages/settings/settings.dart';
import 'package:habitquokka/pages/trackers/pages/new_tracker/new_tracker.dart';
import 'package:habitquokka/pages/trackers/trackers.dart';
import 'package:habitquokka/widgets/dialog_page.dart';

class AppRouter {
  static final router = GoRouter(
    initialLocation: '/',
    debugLogDiagnostics: true,
    errorPageBuilder: (context, state) => _PageBuilder.from<void>(
      state: state,
      child: EmptyPage(
        emoji: Emoji.notFound,
        text: L10n.of(context).emptyPageLabel,
      ),
    ),
    routes: [
      ShellRoute(
        observers: [
          ThemeRouterObserver(),
        ],
        pageBuilder: (context, state, child) => _PageBuilder.from<void>(
          state: state,
          child: HomePage(child: child),
        ),
        routes: <RouteBase>[
          GoRoute(
            path: HomeDestination.onboarding.path,
            pageBuilder: (BuildContext context, GoRouterState state) {
              return _PageBuilder.from<void>(
                state: state,
                child: const OnboardingPage(),
              );
            },
          ),
          GoRoute(
            path: HomeDestination.trackers.path,
            pageBuilder: (BuildContext context, GoRouterState state) {
              return _PageBuilder.from<void>(
                state: state,
                child: const TrackersPage(selectedTrackerId: null),
              );
            },
            routes: [
              GoRoute(
                path: 'new',
                pageBuilder: (context, state) => DialogPage(
                  name: state.location,
                  arguments: {
                    ...state.pathParameters,
                    ...state.queryParameters,
                  },
                  builder: (context) => const NewTrackerAlertPage(),
                ),
              ),
            ],
          ),
          GoRoute(
            path: '${HomeDestination.trackers.path}/:trackerId',
            pageBuilder: (BuildContext context, GoRouterState state) {
              return _PageBuilder.from<void>(
                state: state,
                child: TrackersPage(
                  selectedTrackerId: state.pathParameters['trackerId'],
                ),
              );
            },
          ),
          GoRoute(
            path: HomeDestination.settings.path,
            pageBuilder: (BuildContext context, GoRouterState state) {
              return _PageBuilder.from<void>(
                state: state,
                child: const SettingsPage(),
              );
            },
          ),
        ],
      ),
    ],
  );
}

class ThemeRouterObserver extends NavigatorObserver {
  ThemeRouterObserver();

  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    final shouldResetTheme = HomeDestination.values
        .any((destination) => destination.path == route.settings.name);
    if (!shouldResetTheme) return;

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final context = route.navigator?.context;
      if (context == null) return;
      AdaptiveTheme.of(context).reset();
    });
  }
}

extension _PageBuilder<T> on NoTransitionPage<T> {
  static NoTransitionPage<T> from<T>({
    required GoRouterState state,
    required Widget child,
  }) {
    return NoTransitionPage<T>(
      key: state.pageKey,
      name: state.location,
      arguments: {
        ...state.pathParameters,
        ...state.queryParameters,
      },
      child: child,
    );
  }
}
