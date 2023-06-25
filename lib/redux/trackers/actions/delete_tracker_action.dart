import 'package:habitquokka/models/tracker.dart';
import 'package:habitquokka/redux/redux.dart';
import 'package:habitquokka/redux/trackers/actions/get_trackers_action.dart';

class DeleteTrackerAction extends Action {
  DeleteTrackerAction({
    required this.tracker,
  });

  final Tracker tracker;

  @override
  Future<AppState?> reduce() async {
    await env.supabase.from('trackers').delete().eq('id', tracker.id);
    return null;
  }

  @override
  void after() {
    dispatch(GetTrackersAction());
  }
}
