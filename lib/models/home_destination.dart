import 'package:habitquokka/router/route.dart';

enum HomeDestination {
  onboarding,
  trackers,
  pricing,
  settings,
  about;

  String get path {
    switch (this) {
      case HomeDestination.onboarding:
        return AppRoute.onboarding;
      case HomeDestination.trackers:
        return AppRoute.trackers;
      case HomeDestination.pricing:
        return AppRoute.pricing;
      case HomeDestination.settings:
        return AppRoute.settings;
      case HomeDestination.about:
        return AppRoute.about;
    }
  }
}
