import 'dart:math' as math;

import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'package:habitquokka/l10n/l10n.dart';
import 'package:habitquokka/models/emoji.dart';
import 'package:habitquokka/models/settings_destination.dart';
import 'package:habitquokka/pages/empty/empty.dart';
import 'package:habitquokka/pages/home/pages/settings/pages/markdown/markdown.dart';
import 'package:habitquokka/pages/home/pages/settings/pages/menu/menu.dart';
import 'package:habitquokka/pages/home/pages/settings/view_model.dart';
import 'package:habitquokka/theme/assets.dart';
import 'package:habitquokka/widgets/panel_container.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({
    super.key,
    required this.secondary,
    required this.viewModel,
  });

  final ViewModel viewModel;
  final SettingsDestination? secondary;

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      mobile: _buildSinglePage,
      desktop: _buildSplitPage,
    );
  }

  Widget _buildSinglePage(BuildContext context) {
    if (secondary != null) {
      return _buildSecondaryPage(
        context,
        isSplitPage: false,
      );
    }
    return _buildPrimaryPage(
      context,
      isSplitPage: false,
    );
  }

  Widget _buildSplitPage(BuildContext context) {
    return Scaffold(
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            width: math.max(30.screenWidth, 300),
            child: _buildPrimaryPage(
              context,
              isSplitPage: true,
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(
                top: PanelContainer.defaultPadding.top,
              ),
              child: _buildSecondaryPage(
                context,
                isSplitPage: true,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPrimaryPage(
    BuildContext context, {
    required bool isSplitPage,
  }) {
    return MenuPageConnector(
      padding: PanelContainer.rightPadding(isSplitPage: isSplitPage),
    );
  }

  Widget _buildSecondaryPage(
    BuildContext context, {
    required bool isSplitPage,
  }) {
    final padding =
        PanelContainer.leftPadding(isSplitPage: isSplitPage).copyWith(top: 0);

    return switch (secondary) {
      SettingsDestination.termsOfService => MarkdownPage(
          padding: padding,
          asset: 'assets/terms.md',
        ),
      SettingsDestination.privacyPolicy => MarkdownPage(
          padding: padding,
          asset: 'assets/policy.md',
        ),
      SettingsDestination.licenses => LicensePage(
          applicationName: L10n.of(context).appName,
          applicationVersion: viewModel.version,
          applicationIcon: CircleAvatar(
            child: SvgPicture.asset(AppAssets.logo),
          ),
        ),
      _ => EmptyPage(
          emoji: Emoji.settings,
          text: L10n.of(context).settingsPageNoPageSelectedLabel,
        ),
    };
  }
}
