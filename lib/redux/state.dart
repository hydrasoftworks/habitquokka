import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';

import 'package:habitquokka/redux/account/state.dart';
import 'package:habitquokka/redux/trackers/state.dart';

part 'state.g.dart';

@CopyWith()
class AppState extends Equatable {
  const AppState({
    required this.accountState,
    required this.trackersState,
    required this.version,
  });

  factory AppState.initial() => AppState(
        accountState: AccountState.initial(),
        trackersState: TrackersState.initial(),
        version: null,
      );

  final AccountState accountState;
  final TrackersState trackersState;

  final String? version;

  @override
  List<Object?> get props => [
        accountState,
        trackersState,
        version,
      ];
}
