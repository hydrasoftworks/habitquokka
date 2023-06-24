import 'package:supabase_flutter/supabase_flutter.dart';

import 'package:habitquokka/redux/redux.dart';

class SetUserDetailsAction extends Action {
  SetUserDetailsAction(this.user);

  final User? user;

  @override
  AppState? reduce() {
    final interestedInCommunityFeature =
        user?.userMetadata?[AccountState.interestedInCommunityFeatureKey] ??
            false;

    return state.copyWith(
      accountState: accountState.copyWith(
        interestedInCommunityFeature: interestedInCommunityFeature,
      ),
    );
  }
}
