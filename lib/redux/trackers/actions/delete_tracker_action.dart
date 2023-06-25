import 'package:habitquokka/models/tracker.dart';
import 'package:habitquokka/redux/redux.dart';

class DeleteTrackerAction extends Action {
  DeleteTrackerAction({
    required this.tracker,
  });

  final Tracker tracker;

  @override
  Future<AppState?> reduce() async {
    // TODO: Implement
    return null;
  }
}
