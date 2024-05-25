import 'package:habitquokka/pages/home/pages/settings/pages/profile/connector.dart';
import 'package:habitquokka/pages/home/pages/settings/pages/profile/view_model.dart';
import 'package:habitquokka/redux/account/actions/delete_account_action.dart';
import 'package:habitquokka/redux/account/actions/update_username_action.dart';
import 'package:habitquokka/redux/redux.dart';

class Factory extends VmFactory<AppState, ProfilePageConnector, ViewModel> {
  Factory(super.widget);

  @override
  ViewModel fromStore() => ViewModel(
        profile: state.accountState.profile,
        onUpdateProfile: (username) => dispatchAndWait(
          UpdateUsernameAction(username.trim()),
        ),
        onDeleteAccount: () => dispatchAndWait(DeleteAccountAction()),
      );
}
