import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';

import 'package:habitquokka/redux/account/state.dart';

part 'state.g.dart';

@CopyWith()
class AppState extends Equatable {
  const AppState({
    required this.account,
  });

  factory AppState.initial() => AppState(
        account: AccountState.initial(),
      );

  final AccountState account;

  @override
  List<Object?> get props => [account];
}
