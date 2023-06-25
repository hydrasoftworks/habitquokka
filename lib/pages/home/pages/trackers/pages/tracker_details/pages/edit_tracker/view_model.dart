import 'package:habitquokka/models/tracker.dart';
import 'package:habitquokka/pages/home/pages/trackers/pages/tracker_details/pages/edit_tracker/models/edit_tracker.dart';
import 'package:habitquokka/redux/redux.dart';

typedef OnEditTracker = Future<void> Function(
  String? name,
  String shortName,
);

typedef OnDeleteTracker = Future<void> Function();

class ViewModel extends Vm {
  ViewModel({
    required this.tracker,
    required this.onEditTracker,
    required this.onDeleteTracker,
  }) : super(equals: [
          tracker,
        ]);

  final Tracker tracker;
  final OnEditTracker onEditTracker;
  final OnDeleteTracker onDeleteTracker;

  EditTracker get initialModel => EditTracker(
        name: tracker.name,
        shortName: tracker.shortName,
      );

  Future<void> editTracker(EditTracker model) async {
    await onEditTracker(
      model.name,
      model.shortName,
    );
  }
}
