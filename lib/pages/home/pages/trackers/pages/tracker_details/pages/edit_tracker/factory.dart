import 'package:habitquokka/models/tracker.dart';
import 'package:habitquokka/pages/home/pages/trackers/pages/tracker_details/pages/edit_tracker/connector.dart';
import 'package:habitquokka/pages/home/pages/trackers/pages/tracker_details/pages/edit_tracker/view_model.dart';
import 'package:habitquokka/redux/redux.dart';
import 'package:habitquokka/redux/trackers/actions/delete_tracker_action.dart';
import 'package:habitquokka/redux/trackers/actions/edit_tracker_action.dart';
import 'package:habitquokka/redux/trackers/actions/regenerate_tracker_image_action.dart';

class Factory extends VmFactory<AppState, EditTrackerPageConnector, ViewModel> {
  Factory(
    super.widget, {
    required this.tracker,
  });

  final Tracker tracker;

  @override
  ViewModel fromStore() => ViewModel(
        tracker: tracker,
        onEditTracker: (name, shortName) => dispatchAsync(
          EditTrackerAction(
            tracker: tracker,
            name: name,
            shortName: shortName,
          ),
        ),
        onRegenerateImage: () => dispatchAsync(
          RegenerateTrackerImageAction(tracker: tracker),
        ),
        onDeleteTracker: () => dispatchAsync(
          DeleteTrackerAction(tracker: tracker),
        ),
      );
}
