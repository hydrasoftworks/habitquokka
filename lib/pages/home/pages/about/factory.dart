import 'package:habitquokka/pages/home/pages/about/connector.dart';
import 'package:habitquokka/pages/home/pages/about/view_model.dart';
import 'package:habitquokka/redux/redux.dart';

class Factory extends VmFactory<AppState, AboutPageConnector, ViewModel> {
  Factory(super.widget);

  @override
  ViewModel fromStore() => ViewModel(
        version: state.version,
      );
}
