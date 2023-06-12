import 'package:habitquokka/redux/redux.dart';

class SwitchWindowAction extends Action {
  SwitchWindowAction({
    required this.trackerId,
    required this.key,
  });

  final String trackerId;
  final String key;

  @override
  AppState? reduce() {
    final opened =
        Set.of(trackersState.openedForTracker[trackerId] ?? <String>{});
    opened.contains(key) ? opened.remove(key) : opened.add(key);

    dispatch(_SupabaseSwitchWindowAction(trackerId: trackerId, opened: opened));

    return state.copyWith(
      trackersState: trackersState.copyWith(
        openedForTracker: Map.of(trackersState.openedForTracker)
          ..[trackerId] = opened,
      ),
    );
  }
}

class _SupabaseSwitchWindowAction extends Action {
  _SupabaseSwitchWindowAction({
    required this.trackerId,
    required this.opened,
  });

  final String trackerId;
  final Set<String> opened;

  @override
  Future<AppState?> reduce() async {
    await env.supabase.from('windows').upsert({
      'tracker_id': trackerId,
      'opened': opened.toList(growable: false),
      'updated_at': DateTime.now().toIso8601String(),
    });
    return null;
  }
}
