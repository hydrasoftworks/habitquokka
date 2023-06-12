import 'package:habitquokka/models/tracker.dart';
import 'package:habitquokka/redux/redux.dart';

typedef OnWindowPressed = void Function(String);

class ViewModel extends Vm {
  ViewModel({
    required this.tracker,
    required this.opened,
    required this.onWindowPressed,
  }) : super(equals: [
          tracker,
          opened,
        ]);

  final Tracker tracker;
  final Set<String> opened;
  final OnWindowPressed onWindowPressed;
}
