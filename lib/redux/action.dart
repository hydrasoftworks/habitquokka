import 'dart:async';

import 'package:supabase_flutter/supabase_flutter.dart';

import 'package:habitquokka/redux/redux.dart';

abstract class Action extends ReduxAction<AppState> {
  @override
  Environment get env => super.env as Environment;

  AccountState get accountState => state.accountState;
  TrackersState get trackersState => state.trackersState;

  @override
  Object? wrapError(Object error, StackTrace stackTrace) {
    return switch (error) {
      AuthException(message: final message) =>
        UserException(message).addCause(error),
      PostgrestException(message: final message) =>
        UserException(message).addCause(error),
      TimeoutException(message: final message) =>
        UserException(message).addCause(error),
      _ => super.wrapError(error, stackTrace)
    };
  }
}
