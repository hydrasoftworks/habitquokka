import 'package:supabase_flutter/supabase_flutter.dart';

import 'package:habitquokka/redux/account/actions/get_profile_action.dart';
import 'package:habitquokka/redux/redux.dart';

class UpdateUsernameAction extends Action {
  UpdateUsernameAction(this.username);

  final String username;

  @override
  Future<AppState?> reduce() async {
    final user = env.supabase.auth.currentUser;
    if (user == null) return null;

    await env.supabase.auth.updateUser(
      UserAttributes(
        data: {
          ...user.userMetadata ?? {},
          AccountState.usernameKey: username,
        },
      ),
    );

    await dispatchAsync(GetProfileAction());

    return null;
  }
}
