enum HomeDestination {
  home,
  trackers;

  String get path {
    switch (this) {
      case HomeDestination.home:
        return '/';
      case HomeDestination.trackers:
        return '/trackers';
    }
  }
}
