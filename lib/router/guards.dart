import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';

import 'package:habitquokka/redux/redux.dart';
import 'package:habitquokka/router/route.dart';

class UnauthenticatedGuard {
  static String? redirect(
    BuildContext context,
    GoRouterState state,
  ) {
    final isSignedIn = context.state.accountState.isAuthenticated;
    return isSignedIn ? null : AppRoute.authentication(state.uri.toString());
  }
}

class AuthenticatedGuard {
  static String? redirect(
    BuildContext context,
    GoRouterState state,
  ) {
    final isSignedIn = context.state.accountState.isAuthenticated;
    if (isSignedIn) {
      return state.uri.queryParameters['redirect'] ?? AppRoute.onboarding;
    }

    return null;
  }
}
