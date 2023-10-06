import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'profile.g.dart';

@CopyWith()
@JsonSerializable()
class Profile extends Equatable {
  const Profile({
    required this.id,
    required this.username,
    required this.updatedAt,
    required this.createdAt,
  });

  factory Profile.fromJson(Map<String, dynamic> json) =>
      _$ProfileFromJson(json);

  static const int maxUsernameLength = 20;

  @JsonKey(includeToJson: false)
  final String id;
  final String username;
  final DateTime updatedAt;
  final DateTime createdAt;

  @override
  List<Object?> get props => [id, updatedAt];

  Map<String, dynamic> toJson() => _$ProfileToJson(this);
}
