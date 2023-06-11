import 'package:habitquokka/pages/home/pages/trackers/pages/new_tracker/models/new_tracker.dart';
import 'package:habitquokka/redux/redux.dart';

typedef OnCreateTracker = Future<void> Function(
  String? name,
  String shortName,
);

class ViewModel extends Vm {
  ViewModel({
    required this.trackerCreatedEvt,
    required this.onCreateTracker,
  }) : super(equals: [trackerCreatedEvt]);

  final Event<String> trackerCreatedEvt;
  final OnCreateTracker onCreateTracker;

  Future<void> createTracker(NewTracker model) {
    return onCreateTracker(model.name, model.shortName);
  }
}
