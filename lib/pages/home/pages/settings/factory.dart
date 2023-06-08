import 'package:habitquokka/pages/home/pages/settings/connector.dart';
import 'package:habitquokka/pages/home/pages/settings/view_model.dart';
import 'package:habitquokka/redux/account/actions/sign_out_action.dart';
import 'package:habitquokka/redux/redux.dart';

class Factory extends VmFactory<AppState, SettingsPageConnector, ViewModel> {
  Factory(super.widget);

  @override
  ViewModel fromStore() => ViewModel(
        version: state.version,
        onSignOut: () => dispatch(SignOutAction()),
      );
}
