import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';

import 'package:habitquokka/l10n/l10n.dart';
import 'package:habitquokka/pages/home/pages/settings/view_model.dart';
import 'package:habitquokka/router/route.dart';
import 'package:habitquokka/theme/theme.dart';
import 'package:habitquokka/widgets/panel_container.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({
    super.key,
    required this.viewModel,
  });

  final ViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PanelContainer(
            surfaceColor: SurfaceColor.surfaceContainerLow,
            child: Column(
              children: [
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
          Align(
            alignment: Alignment.bottomRight,
            child: _buildVersion(context, viewModel.version),
          ),
        ],
      ),
    );
  }

  Widget _buildVersion(BuildContext context, String? version) {
    if (version == null) return const SizedBox.shrink();

    return Padding(
      padding: EdgeInsets.only(
        bottom: 6,
        right: Theme.of(context).appSpacing.medium,
      ),
      child: SelectableText(
        version,
        style: Theme.of(context).textTheme.bodySmall,
      ),
    );
  }
}
