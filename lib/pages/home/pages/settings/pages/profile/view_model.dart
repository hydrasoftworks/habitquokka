import 'package:habitquokka/redux/redux.dart';

typedef OnDeleteAccount = Future<void> Function();

class ViewModel extends Vm {
  ViewModel({
    required this.onDeleteAccount,
  }) : super(equals: []);

  final OnDeleteAccount onDeleteAccount;
}
