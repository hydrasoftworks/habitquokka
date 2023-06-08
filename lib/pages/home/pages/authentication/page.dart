import 'package:flutter/material.dart';

import 'package:habitquokka/pages/home/pages/authentication/pages/sign_in/sign_in.dart';
import 'package:habitquokka/pages/home/pages/authentication/pages/sign_on/sign_on.dart';
import 'package:habitquokka/pages/home/pages/authentication/view_model.dart';
import 'package:habitquokka/widgets/panel_container.dart';

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
        child: PanelContainer(
          child: Center(
            child: SizedBox(
              width: 600,
              child: switch (_mode) {
                _Mode.signIn => SignInPage(
                    onSwitchToSignOn: () => setState(
                      () => _mode = _Mode.signOn,
                    ),
                    onSignIn: widget.viewModel.signIn,
                  ),
                _Mode.signOn => SignOnPage(
                    onSwitchToSignIn: () => setState(
                      () => _mode = _Mode.signIn,
                    ),
                    onSignOn: widget.viewModel.signOn,
                  ),
              },
            ),
          ),
        ),
      ),
    );
  }
}
