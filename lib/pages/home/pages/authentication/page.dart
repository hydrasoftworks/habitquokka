import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';

import 'package:habitquokka/pages/home/pages/authentication/pages/sign_in/sign_in.dart';
import 'package:habitquokka/pages/home/pages/authentication/pages/sign_on/sign_on.dart';
import 'package:habitquokka/pages/home/pages/authentication/view_model.dart';
import 'package:habitquokka/router/route.dart';
import 'package:habitquokka/theme/theme.dart';
import 'package:habitquokka/widgets/panel.dart';

enum _Mode {
  signIn,
  signOn,
}

class AuthenticationPage extends StatefulWidget {
  const AuthenticationPage({
    super.key,
    required this.viewModel,
  });

  final ViewModel viewModel;

  @override
  State<AuthenticationPage> createState() => _AuthenticationPageState();
}

class _AuthenticationPageState extends State<AuthenticationPage> {
  _Mode _mode = _Mode.signOn;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Panel(
          child: Center(
            child: SizedBox(
              width: Theme.of(context).appSize.modalWidth,
              child: switch (_mode) {
                _Mode.signIn => SignInPage(
                    onSwitchToSignOn: () => setState(
                      () => _mode = _Mode.signOn,
                    ),
                    onSignIn: (model) => widget.viewModel.signIn(
                      model,
                      _getRedirect(context),
                    ),
                  ),
                _Mode.signOn => SignOnPage(
                    onSwitchToSignIn: () => setState(
                      () => _mode = _Mode.signIn,
                    ),
                    onSignOn: (model) => widget.viewModel.signOn(
                      model,
                      _getRedirect(context),
                    ),
                  ),
              },
            ),
          ),
        ),
      ),
    );
  }

  String _getRedirect(BuildContext context) {
    return GoRouterState.of(context).queryParameters['redirect'] ??
        AppRoute.onboarding;
  }
}
