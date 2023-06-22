import 'package:habitquokka/router/route.dart';

enum SettingsDestination {
  licenses;

  String get path {
    switch (this) {
      case SettingsDestination.licenses:
        return AppRoute.settingsLicenses;
    }
  }
}
