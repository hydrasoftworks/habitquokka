import 'package:habitquokka/models/tracker.dart';
import 'package:habitquokka/redux/redux.dart';

class ViewModel extends Vm {
  ViewModel({
    required this.trackers,
  }) : super(equals: [trackers]);

  final List<Tracker> trackers;
}
