import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:url_strategy/url_strategy.dart';

import 'package:habitquokka/app.dart';
import 'package:habitquokka/redux/account/actions/check_authentication_action.dart';
import 'package:habitquokka/redux/redux.dart';

void main() async {
  _registerFontsLicenses();
  setPathUrlStrategy();

  if (const String.fromEnvironment('APP_URL').isEmpty) {
    throw AssertionError(
      'Environment json file is not set. Use --dart-define-from-file=[environment].json to set it.',
    );
  }

  await Supabase.initialize(
    url: const String.fromEnvironment('SUPABASE_URL'),
    anonKey: const String.fromEnvironment('SUPABASE_API_KEY'),
  );

  final store = Store<AppState>(
    initialState: AppState.initial(),
    environment: Environment(
      supabase: Supabase.instance.client,
    ),
    actionObservers: kDebugMode ? [ConsoleActionObserver()] : null,
  );

  store.dispatch(CheckAuthenticationAction());

  runApp(App(store: store));
}

void _registerFontsLicenses() {
  LicenseRegistry.addLicense(() async* {
    yield LicenseEntryWithLineBreaks(
      ['font: Lilita One'],
      await rootBundle.loadString('assets/fonts/Lilita_One/OFL.txt'),
    );
    yield LicenseEntryWithLineBreaks(
      ['font: Noto Sans'],
      await rootBundle.loadString('assets/fonts/Noto_Sans/OFL.txt'),
    );
  });
}
