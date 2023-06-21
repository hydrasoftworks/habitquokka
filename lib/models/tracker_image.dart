import 'package:json_annotation/json_annotation.dart';

part 'tracker_image.g.dart';

enum ImageSource { unsplash }

@JsonSerializable()
class TrackerImage {
  const TrackerImage({
    required this.source,
    required this.imageUrl,
    required this.pageUrl,
    required this.authorUrl,
    required this.author,
  });

  factory TrackerImage.fromJson(Map<String, dynamic> json) =>
      _$TrackerImageFromJson(json);

  final ImageSource source;
  final String imageUrl;
  final String pageUrl;
  final String authorUrl;
  final String author;

  Map<String, dynamic> toJson() => _$TrackerImageToJson(this);
}
