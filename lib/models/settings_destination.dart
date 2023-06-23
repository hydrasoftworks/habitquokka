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
}
