import 'package:habitquokka/models/tracker.dart';
import 'package:habitquokka/redux/redux.dart';

class GetTrackersAction extends Action {
  @override
  Future<AppState?> reduce() async {
    final response = await env.supabase
        .from('trackers')
        .select<List<Map<String, dynamic>>>()
        .order('created_at', ascending: false);

    return state.copyWith(
      trackersState: state.trackersState.copyWith(
        trackers: response
            .map((trackerData) => Tracker.fromJson(trackerData))
            .toList(growable: false),
      ),
    );
  }
}
