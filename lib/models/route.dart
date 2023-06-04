class AppRoute {
  static const String onboarding = '/';
  static const String trackers = '/trackers';
  static String trackerDetails(String id) => '$trackers/$id';
  static const String newTracker = '$trackers/new';
  static const String settings = '/settings';
}
