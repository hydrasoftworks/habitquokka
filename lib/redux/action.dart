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
      AuthException(message: var message) => UserException(
          message,
          cause: error,
        ),
      _ => super.wrapError(error, stackTrace)
    };
  }
}
