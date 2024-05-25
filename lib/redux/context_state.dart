import 'package:flutter/material.dart';

import 'package:async_redux/async_redux.dart';

import 'package:habitquokka/redux/state.dart';

extension BuildContextExtension on BuildContext {
  AppState get state => getState<AppState>();
}
