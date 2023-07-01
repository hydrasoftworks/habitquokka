import 'dart:ui' as ui;

import 'package:habitquokka/models/tracker.dart';
import 'package:habitquokka/redux/redux.dart';

typedef OnWindowPressed = void Function(String);

class ViewModel extends Vm {
  ViewModel({
    required this.tracker,
    required this.opened,
    required this.seedColorChangedEvt,
    required this.onWindowPressed,
  }) : super(equals: [
          tracker,
          opened,
          seedColorChangedEvt,
        ]);

  final Tracker tracker;
  final Set<String> opened;
  final Event<ui.Color> seedColorChangedEvt;
  final OnWindowPressed onWindowPressed;
}
