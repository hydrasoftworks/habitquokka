import 'package:habitquokka/pages/home/pages/about/pages/menu/connector.dart';
import 'package:habitquokka/pages/home/pages/about/pages/menu/view_model.dart';
import 'package:habitquokka/redux/redux.dart';

class Factory extends VmFactory<AppState, MenuPageConnector, ViewModel> {
  Factory(super.widget);

  @override
  ViewModel fromStore() => ViewModel();
}
