import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';

import 'package:habitquokka/l10n/l10n.dart';
import 'package:habitquokka/pages/home/pages/about/models/about_destination.dart';
import 'package:habitquokka/pages/home/pages/about/pages/menu/view_model.dart';
import 'package:habitquokka/widgets/panel_container.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({
    super.key,
    required this.padding,
    required this.viewModel,
  });

  final EdgeInsets padding;
  final ViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    final location = GoRouterState.of(context).location;

    return Scaffold(
      body: PanelContainer(
        padding: padding,
        child: ListView.builder(
          itemCount: AboutDestination.values.length,
          itemBuilder: (context, index) {
            final destination = AboutDestination.values[index];
            return ListTile(
              onTap: () => GoRouter.of(context).go(destination.path),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              selected: location == destination.path,
              title: Text(destination.name(L10n.of(context))),
            );
          },
        ),
      ),
    );
  }
}
