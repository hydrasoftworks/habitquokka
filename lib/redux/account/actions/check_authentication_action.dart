import 'package:habitquokka/redux/account/actions/set_user_details_action.dart';
import 'package:habitquokka/redux/redux.dart';

class CheckAuthenticationAction extends Action {
  @override
  AppState? reduce() {
    final user = env.supabase.auth.currentUser;

    dispatch(SetUserDetailsAction(user));

    return state.copyWith(
      accountState: accountState.copyWith(
        isAuthenticated: user != null,
      ),
    );
  }
}
