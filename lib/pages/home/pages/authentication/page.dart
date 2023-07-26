import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';

import 'package:habitquokka/pages/home/pages/authentication/pages/sign_in/sign_in.dart';
import 'package:habitquokka/pages/home/pages/authentication/pages/sign_up/sign_up.dart';
import 'package:habitquokka/pages/home/pages/authentication/view_model.dart';
import 'package:habitquokka/router/route.dart';
import 'package:habitquokka/theme/theme.dart';
import 'package:habitquokka/widgets/panel.dart';

enum _Mode {
  signIn,
  signUp,
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
  _Mode _mode = _Mode.signUp;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Panel(
          child: Center(
            child: SizedBox(
              width: Theme.of(context).appSize.modalWidth,
              child: switch (_mode) {
                _Mode.signIn => SignInPage(
                    onSwitchToSignUp: () => setState(
                      () => _mode = _Mode.signUp,
                    ),
                    onSignIn: (model) => widget.viewModel.signIn(
                      model,
                      _getRedirect(context),
                    ),
                  ),
                _Mode.signUp => SignUpPage(
                    onSwitchToSignIn: () => setState(
                      () => _mode = _Mode.signIn,
                    ),
                    onSignUp: (model) => widget.viewModel.signUp(
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
