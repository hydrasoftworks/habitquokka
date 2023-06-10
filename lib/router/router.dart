import 'package:flutter/material.dart';

import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:go_router/go_router.dart';

import 'package:habitquokka/l10n/l10n.dart';
import 'package:habitquokka/models/emoji.dart';
import 'package:habitquokka/models/home_destination.dart';
import 'package:habitquokka/pages/empty/empty.dart';
import 'package:habitquokka/pages/home/home.dart';
import 'package:habitquokka/pages/home/pages/authentication/authentication.dart';
import 'package:habitquokka/pages/home/pages/onboarding/onboarding.dart';
import 'package:habitquokka/pages/home/pages/settings/connector.dart';
import 'package:habitquokka/pages/home/pages/settings/settings.dart';
import 'package:habitquokka/pages/home/pages/trackers/pages/new_tracker/new_tracker.dart';
import 'package:habitquokka/pages/home/pages/trackers/trackers.dart';
import 'package:habitquokka/redux/redux.dart';
import 'package:habitquokka/router/guards.dart';
import 'package:habitquokka/router/route.dart';

class AppRouter {
  static final router = GoRouter(
    initialLocation: AppRoute.onboarding,
    debugLogDiagnostics: Environment.isDebug,
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
          child: UserExceptionDialog<AppState>(
            useLocalContext: true,
            child: HomePage(child: child),
          ),
        ),
        routes: <RouteBase>[
          GoRoute(
            path: AppRoute.onboarding,
            pageBuilder: (BuildContext context, GoRouterState state) {
              return _PageBuilder.from<void>(
                state: state,
                child: const OnboardingPage(),
              );
            },
          ),
          GoRoute(
            path: AppRoute.authentication(),
            redirect: AuthenticatedGuard.redirect,
            pageBuilder: (BuildContext context, GoRouterState state) {
              return _PageBuilder.from<void>(
                state: state,
                child: const AuthenticationPageConnector(),
              );
            },
          ),
          GoRoute(
            path: AppRoute.trackers,
            redirect: UnauthenticatedGuard.redirect,
            pageBuilder: (BuildContext context, GoRouterState state) {
              return _PageBuilder.from<void>(
                state: state,
                child: const TrackersPageConnector(selectedTrackerId: null),
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
                  builder: (context) => const NewTrackerPageConnector(),
                ),
              ),
            ],
          ),
          GoRoute(
            path: AppRoute.trackerDetails(':trackerId'),
            redirect: UnauthenticatedGuard.redirect,
            pageBuilder: (BuildContext context, GoRouterState state) {
              return _PageBuilder.from<void>(
                state: state,
                child: TrackersPageConnector(
                  selectedTrackerId: state.pathParameters['trackerId'],
                ),
              );
            },
          ),
          GoRoute(
            path: AppRoute.settings,
            redirect: UnauthenticatedGuard.redirect,
            pageBuilder: (BuildContext context, GoRouterState state) {
              return _PageBuilder.from<void>(
                state: state,
                child: const SettingsPageConnector(),
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

class DialogPage<T> extends Page<T> {
  const DialogPage({
    super.key,
    super.name,
    super.arguments,
    required this.builder,
  });

  final WidgetBuilder builder;

  @override
  Route<T> createRoute(BuildContext context) => DialogRoute<T>(
        context: context,
        settings: this,
        barrierColor: Colors.transparent,
        barrierDismissible: false,
        builder: builder,
      );
}
