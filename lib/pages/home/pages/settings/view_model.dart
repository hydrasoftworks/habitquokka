import 'package:flutter/foundation.dart';

import 'package:habitquokka/redux/redux.dart';

class ViewModel extends Vm {
  ViewModel({
    required this.onSignOut,
  }) : super(equals: []);

  final VoidCallback onSignOut;
}
