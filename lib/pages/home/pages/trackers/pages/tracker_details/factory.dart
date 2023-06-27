import 'package:habitquokka/models/tracker.dart';
import 'package:habitquokka/pages/home/pages/trackers/pages/tracker_details/connector.dart';
import 'package:habitquokka/pages/home/pages/trackers/pages/tracker_details/view_model.dart';
import 'package:habitquokka/redux/redux.dart';
import 'package:habitquokka/redux/trackers/actions/switch_window_action.dart';

class Factory
    extends VmFactory<AppState, TrackerDetailsPageConnector, ViewModel> {
  Factory(
    super.widget, {
    required this.tracker,
  });

  final Tracker tracker;

  @override
  ViewModel fromStore() => ViewModel(
        tracker: tracker,
        opened: state.trackersState.openedForTracker[tracker.id] ?? {},
        seedColor: tracker.seedColor,
        onWindowPressed: (key) => dispatch(
          SwitchWindowAction(trackerId: tracker.id, key: key),
        ),
      );
}
