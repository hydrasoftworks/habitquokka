import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';

part 'state.g.dart';

@CopyWith()
class AccountState extends Equatable {
  const AccountState({
    required this.isAuthenticated,
    required this.interestedInCommunityFeature,
  });

  factory AccountState.initial() => const AccountState(
        isAuthenticated: false,
        interestedInCommunityFeature: false,
      );

  static const String usernameKey = 'username';
  static const String interestedInCommunityFeatureKey =
      'interested_in_community_feature';

  final bool isAuthenticated;
  final bool interestedInCommunityFeature;

  @override
  List<Object?> get props => [
        isAuthenticated,
        interestedInCommunityFeature,
      ];
}
