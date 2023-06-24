import 'package:habitquokka/l10n/l10n.dart';
import 'package:habitquokka/router/route.dart';

enum AboutDestination {
  help,
  termsOfService,
  privacyPolicy,
  licenses;

  String get path {
    switch (this) {
      case AboutDestination.help:
        return AppRoute.aboutHelp;
      case AboutDestination.termsOfService:
        return AppRoute.aboutTermsOfService;
      case AboutDestination.privacyPolicy:
        return AppRoute.aboutPrivacyPolicy;
      case AboutDestination.licenses:
        return AppRoute.aboutLicenses;
    }
  }

  String name(L10n l10n) {
    switch (this) {
      case AboutDestination.help:
        return l10n.aboutDestinationHelp;
      case AboutDestination.termsOfService:
        return l10n.aboutDestinationTermsOfService;
      case AboutDestination.privacyPolicy:
        return l10n.aboutDestinationPrivacyPolicy;
      case AboutDestination.licenses:
        return l10n.aboutDestinationLicenses;
    }
  }
}
