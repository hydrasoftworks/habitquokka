import 'package:habitquokka/router/route.dart';

enum HomeDestination {
  onboarding,
  trackers,
  pricing,
  community,
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
      case HomeDestination.community:
        return AppRoute.community;
      case HomeDestination.settings:
        return AppRoute.settings;
      case HomeDestination.about:
        return AppRoute.about;
    }
  }
}
