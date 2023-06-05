import 'package:habitquokka/redux/redux.dart';

abstract class Action extends ReduxAction<int> {
  @override
  Environment get env => super.env as Environment;
}
