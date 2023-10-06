import 'package:flutter/material.dart';

import 'package:habitquokka/pages/home/pages/settings/pages/profile/factory.dart';
import 'package:habitquokka/pages/home/pages/settings/pages/profile/page.dart';
import 'package:habitquokka/pages/home/pages/settings/pages/profile/view_model.dart';
import 'package:habitquokka/redux/account/actions/get_profile_action.dart';
import 'package:habitquokka/redux/actions/get_version_action.dart';
import 'package:habitquokka/redux/redux.dart';
import 'package:habitquokka/widgets/panel.dart';

class ProfilePageConnector extends StatelessWidget {
  const ProfilePageConnector({
    super.key,
    this.padding = Panel.defaultPadding,
  });

  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, ViewModel>(
      vm: () => Factory(this),
      onInit: (store) {
        store.dispatch(GetVersionAction());
        store.dispatch(GetProfileAction());
      },
      builder: (context, viewModel) => ProfilePage(
        padding: padding,
        viewModel: viewModel,
      ),
    );
  }
}
