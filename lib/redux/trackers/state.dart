import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';

import 'package:habitquokka/models/tracker.dart';

part 'state.g.dart';

@CopyWith()
class TrackersState extends Equatable {
  const TrackersState({
    required this.trackers,
  });

  factory TrackersState.initial() => const TrackersState(
        trackers: [],
      );

  final List<Tracker> trackers;

  @override
  List<Object?> get props => [trackers];
}
