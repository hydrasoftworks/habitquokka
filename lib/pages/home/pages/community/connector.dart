import 'package:flutter/material.dart';

import 'package:habitquokka/pages/home/pages/community/factory.dart';
import 'package:habitquokka/pages/home/pages/community/page.dart';
import 'package:habitquokka/pages/home/pages/community/view_model.dart';
import 'package:habitquokka/redux/actions/get_version_action.dart';
import 'package:habitquokka/redux/redux.dart';

class CommunityPageConnector extends StatelessWidget {
  const CommunityPageConnector({super.key});

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, ViewModel>(
      vm: () => Factory(this),
      onInit: (store) => store.dispatch(GetVersionAction()),
      builder: (context, viewModel) => CommunityPage(
        viewModel: viewModel,
      ),
    );
  }
}
