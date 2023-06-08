import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';

import 'package:habitquokka/pages/home/pages/authentication/factory.dart';
import 'package:habitquokka/pages/home/pages/authentication/page.dart';
import 'package:habitquokka/pages/home/pages/authentication/view_model.dart';
import 'package:habitquokka/redux/redux.dart';
import 'package:habitquokka/router/route.dart';

class AuthenticationPageConnector extends StatelessWidget {
  const AuthenticationPageConnector({super.key});

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, ViewModel>(
      vm: () => Factory(this),
      onWillChange: (context, _, previousVm, newVm) {
        if (context == null) return;
        if (previousVm.isAuthenticated != newVm.isAuthenticated &&
            newVm.isAuthenticated) {
          final queryParameters = GoRouterState.of(context).queryParameters;
          GoRouter.of(context)
              .go(queryParameters['redirect'] ?? AppRoute.onboarding);
        }
      },
      builder: (context, viewModel) => AuthenticationPage(
        viewModel: viewModel,
      ),
    );
  }
}
