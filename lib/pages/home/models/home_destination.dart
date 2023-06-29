import 'package:habitquokka/l10n/l10n.dart';
import 'package:habitquokka/router/route.dart';

enum HomeDestination {
  onboarding,
  trackers,
  pricing,
  community,
  settings,
  about,
  more;

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
      case HomeDestination.more:
        return AppRoute.more;
    }
  }

  String name(L10n l10n) {
    switch (this) {
      case HomeDestination.onboarding:
        return l10n.homeDestinationOnboardingLabel;
      case HomeDestination.trackers:
        return l10n.homeDestinationTrackerLabel;
      case HomeDestination.pricing:
        return l10n.homeDestinationPricingLabel;
      case HomeDestination.community:
        return l10n.homeDestinationCommunityLabel;
      case HomeDestination.settings:
        return l10n.homeDestinationSettingsLabel;
      case HomeDestination.about:
        return l10n.homeDestinationAboutLabel;
      case HomeDestination.more:
        return l10n.homeDestinationMoreLabel;
    }
  }
}
