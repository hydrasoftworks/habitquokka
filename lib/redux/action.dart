import 'package:habitquokka/redux/redux.dart';

abstract class Action extends ReduxAction<AppState> {
  @override
  Environment get env => super.env as Environment;

  AccountState get accountState => state.accountState;
}
