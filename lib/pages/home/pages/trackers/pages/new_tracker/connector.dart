import 'package:flutter/material.dart';

import 'package:habitquokka/pages/home/pages/trackers/pages/new_tracker/factory.dart';
import 'package:habitquokka/pages/home/pages/trackers/pages/new_tracker/page.dart';
import 'package:habitquokka/pages/home/pages/trackers/pages/new_tracker/view_model.dart';
import 'package:habitquokka/redux/redux.dart';

class NewTrackerPageConnector extends StatelessWidget {
  const NewTrackerPageConnector({super.key});

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, ViewModel>(
      vm: () => Factory(this),
      builder: (context, viewModel) => NewTrackerPage(
        viewModel: viewModel,
      ),
    );
  }
}
