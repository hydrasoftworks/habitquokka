import 'dart:ui';

import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';

import 'package:habitquokka/models/tracker.dart';
import 'package:habitquokka/redux/redux.dart';

part 'state.g.dart';

@CopyWith()
class TrackersState extends Equatable {
  const TrackersState({
    required this.trackers,
    required this.openedForTracker,
    required this.trackerCreatedEvt,
    required this.seedColorChangedEvt,
  });

  factory TrackersState.initial() => TrackersState(
        trackers: const [],
        openedForTracker: const {},
        trackerCreatedEvt: Event<String>.spent(),
        seedColorChangedEvt: Event<Color>.spent(),
      );

  final List<Tracker> trackers;
  final Map<String, Set<String>> openedForTracker;

  final Event<String> trackerCreatedEvt;
  final Event<Color> seedColorChangedEvt;

  @override
  List<Object?> get props => [
        trackers,
        openedForTracker,
        trackerCreatedEvt,
        seedColorChangedEvt,
      ];
}
