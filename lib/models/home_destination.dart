enum HomeDestination {
  onboarding,
  trackers,
  settings;

  String get path {
    switch (this) {
      case HomeDestination.onboarding:
        return '/';
      case HomeDestination.trackers:
        return '/trackers';
      case HomeDestination.settings:
        return '/settings';
    }
  }
}
