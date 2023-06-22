import 'package:habitquokka/pages/home/pages/settings/pages/menu/connector.dart';
import 'package:habitquokka/pages/home/pages/settings/pages/menu/view_model.dart';
import 'package:habitquokka/redux/account/actions/sign_out_action.dart';
import 'package:habitquokka/redux/redux.dart';

class Factory extends VmFactory<AppState, MenuPageConnector, ViewModel> {
  Factory(super.widget);

  @override
  ViewModel fromStore() => ViewModel(
        onSignOut: () => dispatch(SignOutAction()),
      );
}
