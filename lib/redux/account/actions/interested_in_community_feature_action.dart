import 'package:supabase_flutter/supabase_flutter.dart';

import 'package:habitquokka/redux/redux.dart';

class InterestedInCommunityFeatureAction extends Action {
  InterestedInCommunityFeatureAction({required this.isInterested});

  final bool isInterested;

  @override
  AppState? reduce() {
    final user = env.supabase.auth.currentUser;
    if (user == null) return null;

    env.supabase.auth.updateUser(
      UserAttributes(
        data: {
          ...user.userMetadata ?? {},
          AccountState.interestedInCommunityFeatureKey: isInterested,
        },
      ),
    );

    return state.copyWith(
      accountState: accountState.copyWith(
        interestedInCommunityFeature: isInterested,
      ),
    );
  }
}
