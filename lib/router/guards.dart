import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';

import 'package:habitquokka/redux/redux.dart';
import 'package:habitquokka/router/route.dart';

class UnauthenticatedGuard {
  static String? redirect(
    BuildContext context,
    GoRouterState state,
  ) {
    final isSignedIn =
        StoreProvider.of<AppState>(context, null).state.account.isSignedIn;
    return isSignedIn ? null : AppRoute.authentication(state.location);
  }
}
