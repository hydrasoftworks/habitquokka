class AppRoute {
  static const String onboarding = '/';
  static const String trackers = '/trackers';
  static String trackerDetails(String id) => '$trackers/$id';
  static const String newTracker = '$trackers/new';
  static const String pricing = '/pricing';
  static const String settings = '/settings';
  static String authentication([String? redirectPath]) =>
      '/auth${redirectPath != null ? '?redirect=$redirectPath' : ''}';
}
