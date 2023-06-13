import 'package:habitquokka/models/tracker.dart';
import 'package:habitquokka/redux/redux.dart';

class GetTrackersAction extends Action {
  @override
  Future<AppState?> reduce() async {
    final trackers = await env.supabase
        .from('trackers')
        .select<List<Map<String, dynamic>>>()
        .order('created_at', ascending: false)
        .withConverter((data) => data.map(Tracker.fromJson));

    return state.copyWith(
      trackersState: state.trackersState.copyWith(
        trackers: trackers.toList(growable: false),
      ),
    );
  }
}
