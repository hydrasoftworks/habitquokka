enum ImageSource { unsplash }

class TrackerImage {
  const TrackerImage({
    required this.source,
    required this.rawUrl,
    required this.pageUrl,
    required this.author,
  });

  final ImageSource source;
  final String rawUrl;
  final String pageUrl;
  final String author;
}
