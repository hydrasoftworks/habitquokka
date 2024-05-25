import 'package:habitquokka/models/profile.dart';
import 'package:habitquokka/redux/redux.dart';

class GetProfileAction extends Action {
  @override
  Future<AppState?> reduce() async {
    final user = env.supabase.auth.currentUser;
    if (user == null) return null;

    final profile = await env.supabase
        .from('profiles')
        .select()
        .eq('id', user.id)
        .single()
        .withConverter(Profile.fromJson);

    return state.copyWith(
      accountState: accountState.copyWith(
        profile: profile,
      ),
    );
  }
}
