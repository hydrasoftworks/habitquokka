import 'package:habitquokka/pages/home/pages/trackers/pages/new_tracker/connector.dart';
import 'package:habitquokka/pages/home/pages/trackers/pages/new_tracker/view_model.dart';
import 'package:habitquokka/redux/redux.dart';
import 'package:habitquokka/redux/trackers/actions/create_tracker_action.dart';

class Factory extends VmFactory<AppState, NewTrackerPageConnector, ViewModel> {
  Factory(super.widget);

  @override
  ViewModel fromStore() => ViewModel(
        trackerCreatedEvt: state.trackersState.trackerCreatedEvt,
        onCreateTracker: (name, shortName) => dispatchAndWait(
          CreateTrackerAction(name: name, shortName: shortName),
        ),
      );
}
