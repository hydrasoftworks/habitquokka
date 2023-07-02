import 'package:habitquokka/models/tracker.dart';
import 'package:habitquokka/redux/redux.dart';
import 'package:habitquokka/redux/trackers/actions/get_trackers_action.dart';

class EditTrackerAction extends Action {
  EditTrackerAction({
    required this.tracker,
    required this.name,
    required this.shortName,
    required this.randomizeNumbers,
  });

  final Tracker tracker;
  final String? name;
  final String shortName;
  final bool randomizeNumbers;

  @override
  Future<AppState?> reduce() async {
    await env.supabase.from('trackers').update({
      'name': name,
      'short_name': shortName,
      'randomize_numbers': randomizeNumbers,
      'updated_at': DateTime.now().toIso8601String(),
    }).eq('id', tracker.id);
    return null;
  }

  @override
  void after() {
    dispatch(GetTrackersAction());
  }
}
