import 'package:flutter/material.dart';

import 'package:habitquokka/models/about_destination.dart';
import 'package:habitquokka/pages/home/pages/about/factory.dart';
import 'package:habitquokka/pages/home/pages/about/page.dart';
import 'package:habitquokka/pages/home/pages/about/view_model.dart';
import 'package:habitquokka/redux/actions/get_version_action.dart';
import 'package:habitquokka/redux/redux.dart';

class AboutPageConnector extends StatelessWidget {
  const AboutPageConnector(this.secondary, {super.key});

  final AboutDestination? secondary;

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, ViewModel>(
      vm: () => Factory(this),
      onInit: (store) => store.dispatch(GetVersionAction()),
      builder: (context, viewModel) => AboutPage(
        secondary: secondary,
        viewModel: viewModel,
      ),
    );
  }
}
