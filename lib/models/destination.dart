enum Destination {
  home,
  trackers;

  String get path {
    switch (this) {
      case Destination.home:
        return '/';
      case Destination.trackers:
        return '/trackers';
    }
  }
}
