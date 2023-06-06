import 'package:flutter/material.dart';

import 'package:habitquokka/pages/home/pages/authentication/factory.dart';
import 'package:habitquokka/pages/home/pages/authentication/page.dart';
import 'package:habitquokka/pages/home/pages/authentication/view_model.dart';
import 'package:habitquokka/redux/redux.dart';

class AuthenticationPageConnector extends StatelessWidget {
  const AuthenticationPageConnector({super.key});

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, ViewModel>(
      vm: () => Factory(this),
      builder: (context, viewModel) => AuthenticationPage(
        viewModel: viewModel,
      ),
    );
  }
}
