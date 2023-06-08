import 'package:flutter/foundation.dart';

import 'package:habitquokka/redux/redux.dart';

class ViewModel extends Vm {
  ViewModel({
    required this.version,
    required this.onSignOut,
  }) : super(equals: [version]);

  final String? version;

  final VoidCallback onSignOut;
}
