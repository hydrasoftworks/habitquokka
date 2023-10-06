import 'package:supabase_flutter/supabase_flutter.dart';

import 'package:habitquokka/redux/redux.dart';

class GetOpenedWindowsAction extends Action {
  GetOpenedWindowsAction(this.trackerId);
  final String trackerId;

  @override
  Future<AppState?> reduce() async {
    final result = await env.supabase
        .from('windows')
        .select<PostgrestMap?>()
        .eq('tracker_id', trackerId)
        .maybeSingle();

    final opened = result?['opened'];
    if (opened == null) return null;

    return state.copyWith(
      trackersState: trackersState.copyWith(
        openedForTracker: {
          ...trackersState.openedForTracker,
          trackerId: Set<String>.from(opened),
        },
      ),
    );
  }
}
