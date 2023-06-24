import 'package:habitquokka/redux/redux.dart';

class SignOutAction extends Action {
  @override
  Future<AppState?> reduce() async {
    await env.supabase.auth.signOut();
    return state.copyWith(
      accountState: accountState.copyWith(
        isAuthenticated: false,
        interestedInCommunityFeature: false,
      ),
    );
  }
}
