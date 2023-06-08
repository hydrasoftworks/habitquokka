import 'package:flutter/material.dart';

import 'package:habitquokka/pages/home/pages/settings/factory.dart';
import 'package:habitquokka/pages/home/pages/settings/page.dart';
import 'package:habitquokka/pages/home/pages/settings/view_model.dart';
import 'package:habitquokka/redux/actions/get_version_action.dart';
import 'package:habitquokka/redux/redux.dart';

class SettingsPageConnector extends StatelessWidget {
  const SettingsPageConnector({super.key});

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, ViewModel>(
      vm: () => Factory(this),
      onInit: (store) => store.dispatch(GetVersionAction()),
      builder: (context, viewModel) => SettingsPage(
        viewModel: viewModel,
      ),
    );
  }
}
