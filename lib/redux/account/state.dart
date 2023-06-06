import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';

part 'state.g.dart';

@CopyWith()
class AccountState extends Equatable {
  const AccountState({
    required this.isAuthenticated,
  });

  factory AccountState.initial() => const AccountState(
        isAuthenticated: false,
      );

  final bool isAuthenticated;

  @override
  List<Object?> get props => [isAuthenticated];
}
