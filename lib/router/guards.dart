import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';

import 'package:habitquokka/redux/redux.dart';
import 'package:habitquokka/router/route.dart';

class UnauthenticatedGuard {
  static String? redirect(
    BuildContext context,
    GoRouterState state,
  ) {
    final isSignedIn = StoreProvider.of<AppState>(context, null)
        .state
        .accountState
        .isAuthenticated;
    return isSignedIn ? null : AppRoute.authentication(state.location);
  }
}

class AuthenticatedGuard {
  static String? redirect(
    BuildContext context,
    GoRouterState state,
  ) {
    final isSignedIn = StoreProvider.of<AppState>(context, null)
        .state
        .accountState
        .isAuthenticated;
    if (isSignedIn) {
      return state.queryParameters['redirect'] ?? AppRoute.onboarding;
    }

    return null;
  }
}
