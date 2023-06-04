import 'package:habitquokka/models/route.dart';

enum HomeDestination {
  onboarding,
  trackers,
  settings;

  String get path {
    switch (this) {
      case HomeDestination.onboarding:
        return AppRoute.onboarding;
      case HomeDestination.trackers:
        return AppRoute.trackers;
      case HomeDestination.settings:
        return AppRoute.settings;
    }
  }
}
