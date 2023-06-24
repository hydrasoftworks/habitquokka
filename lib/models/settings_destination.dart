import 'package:habitquokka/l10n/l10n.dart';
import 'package:habitquokka/router/route.dart';

enum SettingsDestination {
  termsOfService,
  privacyPolicy,
  licenses;

  String get path {
    switch (this) {
      case SettingsDestination.termsOfService:
        return AppRoute.settingsTermsOfService;
      case SettingsDestination.privacyPolicy:
        return AppRoute.settingsPrivacyPolicy;
      case SettingsDestination.licenses:
        return AppRoute.settingsLicenses;
    }
  }

  String name(L10n l10n) {
    switch (this) {
      case SettingsDestination.termsOfService:
        return l10n.settingsDestinationTermsOfService;
      case SettingsDestination.privacyPolicy:
        return l10n.settingsDestinationPrivacyPolicy;
      case SettingsDestination.licenses:
        return l10n.settingsDestinationLicenses;
    }
  }
}
