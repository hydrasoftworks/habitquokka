import 'package:habitquokka/models/tracker.dart';
import 'package:habitquokka/redux/redux.dart';

class ViewModel extends Vm {
  ViewModel({
    required this.trackers,
    required this.selectedTracker,
  }) : super(equals: [
          trackers,
          selectedTracker,
        ]);

  final List<Tracker> trackers;
  final Tracker? selectedTracker;
}
