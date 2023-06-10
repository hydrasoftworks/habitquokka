import 'package:habitquokka/pages/home/pages/trackers/pages/new_tracker/models/new_tracker.dart';
import 'package:habitquokka/redux/redux.dart';

typedef OnCreateTracker = Future<void> Function(
  String? name,
  String shortName,
);

class ViewModel extends Vm {
  ViewModel({
    required this.onCreateTracker,
  }) : super(equals: []);

  final OnCreateTracker onCreateTracker;

  Future<void> createTracker(NewTracker model) {
    return onCreateTracker(model.name, model.shortName);
  }
}
