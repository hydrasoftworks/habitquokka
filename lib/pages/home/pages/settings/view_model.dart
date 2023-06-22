import 'package:habitquokka/redux/redux.dart';

class ViewModel extends Vm {
  ViewModel({
    required this.version,
  }) : super(equals: [version]);

  final String? version;
}
