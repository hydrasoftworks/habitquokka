class Tracker {
  const Tracker({
    required this.id,
    required this.shortName,
    required this.name,
    required this.image,
    required this.rows,
    required this.columns,
    required this.seedColor,
  });

  final String id;
  final String shortName;
  final String name;
  final String image;
  final int rows;
  final int columns;
  final int seedColor;
}
