import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';

import 'package:habitquokka/pages/home/pages/trackers/pages/new_tracker/factory.dart';
import 'package:habitquokka/pages/home/pages/trackers/pages/new_tracker/page.dart';
import 'package:habitquokka/pages/home/pages/trackers/pages/new_tracker/view_model.dart';
import 'package:habitquokka/redux/redux.dart';
import 'package:habitquokka/router/route.dart';

class NewTrackerPageConnector extends StatelessWidget {
  const NewTrackerPageConnector({super.key});

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, ViewModel>(
      vm: () => Factory(this),
      onWillChange: (context, store, previousVm, newVm) {
        if (context == null) return;
        final newTrackerId = newVm.trackerCreatedEvt.consume();
        if (newTrackerId != null) {
          GoRouter.of(context).go(AppRoute.trackerDetails(newTrackerId));
        }
      },
      builder: (context, viewModel) => NewTrackerPage(
        viewModel: viewModel,
      ),
    );
  }
}
