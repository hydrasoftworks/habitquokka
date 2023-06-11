import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';

import 'package:habitquokka/models/tracker.dart';
import 'package:habitquokka/redux/redux.dart';

part 'state.g.dart';

@CopyWith()
class TrackersState extends Equatable {
  const TrackersState({
    required this.trackers,
    required this.trackerCreatedEvt,
  });

  factory TrackersState.initial() => TrackersState(
        trackers: const [],
        trackerCreatedEvt: Event<String>.spent(),
      );

  final List<Tracker> trackers;

  final Event<String> trackerCreatedEvt;

  @override
  List<Object?> get props => [
        trackers,
        trackerCreatedEvt,
      ];
}
