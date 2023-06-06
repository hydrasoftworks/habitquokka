import 'package:habitquokka/redux/redux.dart';

class CheckAuthenticationAction extends Action {
  @override
  AppState? reduce() {
    return state.copyWith(
      accountState: accountState.copyWith(
        isAuthenticated: env.supabase.auth.currentUser != null,
      ),
    );
  }
}
