import 'package:flutter/material.dart';

import 'package:habitquokka/pages/home/pages/trackers/factory.dart';
import 'package:habitquokka/pages/home/pages/trackers/page.dart';
import 'package:habitquokka/pages/home/pages/trackers/view_model.dart';
import 'package:habitquokka/redux/redux.dart';
import 'package:habitquokka/redux/trackers/actions/get_trackers_action.dart';

class TrackersPageConnector extends StatelessWidget {
  const TrackersPageConnector({
    super.key,
    required this.selectedTrackerId,
  });

  final String? selectedTrackerId;

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, ViewModel>(
      vm: () => Factory(this, selectedTrackerId: selectedTrackerId),
      onInit: (store) => store.dispatch(GetTrackersAction()),
      builder: (context, viewModel) => TrackersPage(
        viewModel: viewModel,
      ),
    );
  }
}
