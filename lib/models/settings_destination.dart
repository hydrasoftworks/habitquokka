import 'package:habitquokka/l10n/l10n.dart';
import 'package:habitquokka/router/route.dart';

enum SettingsDestination {
  profile;

  String get path {
    switch (this) {
      case SettingsDestination.profile:
        return AppRoute.settingsProfile;
    }
  }

  String name(L10n l10n) {
    switch (this) {
      case SettingsDestination.profile:
        return l10n.settingsDestinationProfile;
    }
  }
}
