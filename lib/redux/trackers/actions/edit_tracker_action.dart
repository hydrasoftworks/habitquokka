import 'package:habitquokka/models/tracker.dart';
import 'package:habitquokka/redux/redux.dart';

class EditTrackerAction extends Action {
  EditTrackerAction({
    required this.tracker,
    required this.name,
    required this.shortName,
  });

  final Tracker tracker;
  final String? name;
  final String shortName;

  @override
  Future<AppState?> reduce() async {
    // TODO: implement reduce
    return null;
  }
}
