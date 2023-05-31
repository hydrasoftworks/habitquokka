enum HomeDestination {
  onboarding,
  trackers;

  String get path {
    switch (this) {
      case HomeDestination.onboarding:
        return '/';
      case HomeDestination.trackers:
        return '/trackers';
    }
  }
}
