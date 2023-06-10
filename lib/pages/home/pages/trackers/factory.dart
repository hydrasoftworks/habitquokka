import 'package:habitquokka/pages/home/pages/trackers/connector.dart';
import 'package:habitquokka/pages/home/pages/trackers/view_model.dart';
import 'package:habitquokka/redux/redux.dart';

class Factory extends VmFactory<AppState, TrackersPageConnector, ViewModel> {
  Factory(super.widget);

  @override
  ViewModel fromStore() => ViewModel(
        trackers: state.trackersState.trackers,
      );
}
