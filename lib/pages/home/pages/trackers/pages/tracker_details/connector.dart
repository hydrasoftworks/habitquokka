import 'package:flutter/material.dart';

import 'package:habitquokka/models/tracker.dart';
import 'package:habitquokka/pages/home/pages/trackers/pages/tracker_details/factory.dart';
import 'package:habitquokka/pages/home/pages/trackers/pages/tracker_details/page.dart';
import 'package:habitquokka/pages/home/pages/trackers/pages/tracker_details/view_model.dart';
import 'package:habitquokka/redux/redux.dart';
import 'package:habitquokka/redux/trackers/actions/get_opened_windows_action.dart';

class TrackerDetailsPageConnector extends StatelessWidget {
  const TrackerDetailsPageConnector({
    super.key,
    required this.tracker,
    required this.padding,
  });

  final Tracker tracker;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, ViewModel>(
      vm: () => Factory(this, tracker: tracker),
      onInit: (store) => store.dispatch(
        GetOpenedWindowsAction(tracker.id),
      ),
      builder: (context, viewModel) => TrackerDetailsPage(
        viewModel: viewModel,
        padding: padding,
      ),
    );
  }
}
