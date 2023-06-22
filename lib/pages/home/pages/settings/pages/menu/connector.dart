import 'package:flutter/material.dart';

import 'package:habitquokka/pages/home/pages/settings/pages/menu/factory.dart';
import 'package:habitquokka/pages/home/pages/settings/pages/menu/page.dart';
import 'package:habitquokka/pages/home/pages/settings/pages/menu/view_model.dart';
import 'package:habitquokka/redux/redux.dart';

class MenuPageConnector extends StatelessWidget {
  const MenuPageConnector({super.key, required this.padding});

  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, ViewModel>(
      vm: () => Factory(this),
      builder: (context, viewModel) => MenuPage(
        padding: padding,
        viewModel: viewModel,
      ),
    );
  }
}
