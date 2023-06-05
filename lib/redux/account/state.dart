import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';

part 'state.g.dart';

@CopyWith()
class AccountState extends Equatable {
  const AccountState({
    required this.isSignedIn,
  });

  factory AccountState.initial() => const AccountState(
        isSignedIn: false,
      );

  final bool isSignedIn;

  @override
  List<Object?> get props => [isSignedIn];
}
