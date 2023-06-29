import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';

import 'package:habitquokka/l10n/l10n.dart';
import 'package:habitquokka/pages/home/pages/settings/models/settings_destination.dart';
import 'package:habitquokka/pages/home/pages/settings/pages/menu/view_model.dart';
import 'package:habitquokka/router/route.dart';
import 'package:habitquokka/widgets/panel.dart';

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
      resizeToAvoidBottomInset: false,
      body: Panel(
        padding: padding,
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: SettingsDestination.values.length,
                itemBuilder: (context, index) {
                  final destination = SettingsDestination.values[index];
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
            TextButton(
              onPressed: () {
                viewModel.onSignOut();
                GoRouter.of(context).go(AppRoute.onboarding);
              },
              child: Text(L10n.of(context).settingsPageSignOutButtonLabel),
            ),
          ],
        ),
      ),
    );
  }
}
