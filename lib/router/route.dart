class AppRoute {
  static const String onboarding = '/';

  static const String trackers = '/trackers';
  static String trackerDetails(String id) => '$trackers/$id';
  static const String newTracker = '$trackers/new';

  static const String pricing = '/pricing';

  static const String community = '/community';

  static const String settings = '/settings';
  static const String settingsProfile = '/settings/profile';

  static const String about = '/about';
  static const String aboutHelp = '/about/help';
  static const String aboutTermsOfService = '/about/terms';
  static const String aboutPrivacyPolicy = '/about/policy';
  static const String aboutLicenses = '/about/licenses';

  static const String more = '/more';

  static String authentication([String? redirectPath]) =>
      '/auth${redirectPath != null ? '?redirect=$redirectPath' : ''}';
  static const String termsOfService = '/terms';
  static const String privacyPolicy = '/policy';
}
