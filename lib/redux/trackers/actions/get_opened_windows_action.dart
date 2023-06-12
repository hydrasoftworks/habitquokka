import 'package:habitquokka/redux/redux.dart';

class GetOpenedWindowsAction extends Action {
  GetOpenedWindowsAction(this.trackerId);
  final String trackerId;

  @override
  Future<AppState?> reduce() async {
    final result = await env.supabase
        .from('windows')
        .select()
        .eq('tracker_id', trackerId)
        .single();

    final opened = result['opened'];
    if (opened == null) return null;

    return state.copyWith(
      trackersState: trackersState.copyWith(
        openedForTracker: Map.of(trackersState.openedForTracker)
          ..[trackerId] = Set<String>.from(opened),
      ),
    );
  }
}
