import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:url_strategy/url_strategy.dart';

import 'package:habitquokka/app.dart';
import 'package:habitquokka/redux/redux.dart';

void main() async {
  setPathUrlStrategy();

  await dotenv.load(fileName: 'env');

  await Supabase.initialize(
    url: dotenv.get('SUPABASE_URL'),
    anonKey: dotenv.get('SUPABASE_API_KEY'),
  );

  final store = Store<AppState>(
    initialState: AppState.initial(),
    environment: Environment(),
    actionObservers: kDebugMode ? [ConsoleActionObserver()] : null,
  );

  runApp(App(store: store));
}
