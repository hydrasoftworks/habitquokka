import 'package:habitquokka/pages/home/pages/community/connector.dart';
import 'package:habitquokka/pages/home/pages/community/view_model.dart';
import 'package:habitquokka/redux/account/actions/interested_in_community_feature_action.dart';
import 'package:habitquokka/redux/redux.dart';

class Factory extends VmFactory<AppState, CommunityPageConnector, ViewModel> {
  Factory(super.widget);

  @override
  ViewModel fromStore() => ViewModel(
        interestedInCommunityFeature:
            state.accountState.interestedInCommunityFeature,
        onInterestedInCommunityChanged: (isInterested) => dispatch(
          InterestedInCommunityFeatureAction(isInterested: isInterested),
        ),
      );
}
