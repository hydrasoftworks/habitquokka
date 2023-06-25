import 'package:flutter/material.dart';

import 'package:habitquokka/models/tracker.dart';
import 'package:habitquokka/pages/home/pages/trackers/pages/tracker_details/pages/edit_tracker/factory.dart';
import 'package:habitquokka/pages/home/pages/trackers/pages/tracker_details/pages/edit_tracker/page.dart';
import 'package:habitquokka/pages/home/pages/trackers/pages/tracker_details/pages/edit_tracker/view_model.dart';
import 'package:habitquokka/redux/redux.dart';

class EditTrackerPageConnector extends StatelessWidget {
  const EditTrackerPageConnector({
    super.key,
    required this.tracker,
  });

  final Tracker tracker;

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, ViewModel>(
      vm: () => Factory(this, tracker: tracker),
      builder: (context, viewModel) => EditTrackerPage(
        viewModel: viewModel,
      ),
    );
  }
}
