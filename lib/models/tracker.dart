import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'package:habitquokka/models/tracker_image.dart';

part 'tracker.g.dart';

@JsonSerializable()
class Tracker extends Equatable {
  const Tracker({
    required this.id,
    required this.ownerId,
    required this.shortName,
    required this.name,
    required this.image,
    this.rows = 5,
    this.columns = 6,
    required this.seedColor,
    this.randomizeNumbers = true,
  });

  factory Tracker.fromJson(Map<String, dynamic> json) =>
      _$TrackerFromJson(json);

  @JsonKey(includeToJson: false)
  final String id;
  final String ownerId;
  final String shortName;
  final String? name;
  final TrackerImage image;
  final int rows;
  final int columns;
  final int seedColor;
  final bool randomizeNumbers;

  String get fullName => name ?? shortName;

  @override
  List<Object?> get props => [id, shortName, name];

  Map<String, dynamic> toJson() => _$TrackerToJson(this);
}
