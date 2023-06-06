import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';

import 'package:habitquokka/redux/account/state.dart';

part 'state.g.dart';

@CopyWith()
class AppState extends Equatable {
  const AppState({
    required this.accountState,
  });

  factory AppState.initial() => AppState(
        accountState: AccountState.initial(),
      );

  final AccountState accountState;

  @override
  List<Object?> get props => [accountState];
}
