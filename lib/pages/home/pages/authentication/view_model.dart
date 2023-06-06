import 'package:habitquokka/redux/redux.dart';

class ViewModel extends Vm {
  ViewModel({
    required this.onSignInWithOTP,
  }) : super(equals: []);

  final void Function(String) onSignInWithOTP;
}
