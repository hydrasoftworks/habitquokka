enum HomeDestination {
  landing,
  trackers;

  String get path {
    switch (this) {
      case HomeDestination.landing:
        return '/';
      case HomeDestination.trackers:
        return '/trackers';
    }
  }
}
