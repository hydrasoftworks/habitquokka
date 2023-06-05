import 'package:flutter/material.dart';

import 'package:habitquokka/redux/redux.dart';

abstract class AppFactory<T extends Widget?, Model extends Vm>
    extends VmFactory<int, T, Model> {
  AppFactory([T? connector]) : super(connector);

  @override
  Environment get env => super.env as Environment;
}
