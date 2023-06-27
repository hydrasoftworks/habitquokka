import 'dart:math' as math;

import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'package:habitquokka/l10n/l10n.dart';
import 'package:habitquokka/models/emoji.dart';
import 'package:habitquokka/pages/empty/empty.dart';
import 'package:habitquokka/pages/home/pages/about/models/about_destination.dart';
import 'package:habitquokka/pages/home/pages/about/pages/menu/menu.dart';
import 'package:habitquokka/pages/home/pages/about/view_model.dart';
import 'package:habitquokka/pages/markdown/markdown.dart';
import 'package:habitquokka/router/route.dart';
import 'package:habitquokka/theme/assets.dart';
import 'package:habitquokka/widgets/panel.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({
    super.key,
    required this.secondary,
    required this.viewModel,
  });

  final ViewModel viewModel;
  final AboutDestination? secondary;

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
                top: Panel.defaultPadding.top,
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
      padding: Panel.rightPadding(isSplitPage: isSplitPage),
    );
  }

  Widget _buildSecondaryPage(
    BuildContext context, {
    required bool isSplitPage,
  }) {
    final padding = Panel.leftPadding(isSplitPage: isSplitPage);

    return switch (secondary) {
      AboutDestination.help => MarkdownPage(
          onBackPressed: () => GoRouter.of(context).go(AppRoute.about),
          padding: padding,
          title: secondary?.name(L10n.of(context)),
          asset: AppAssets.help,
        ),
      AboutDestination.termsOfService => MarkdownPage(
          onBackPressed: () => GoRouter.of(context).go(AppRoute.about),
          padding: padding,
          title: secondary?.name(L10n.of(context)),
          asset: AppAssets.termOfService,
        ),
      AboutDestination.privacyPolicy => MarkdownPage(
          onBackPressed: () => GoRouter.of(context).go(AppRoute.about),
          padding: padding,
          title: secondary?.name(L10n.of(context)),
          asset: AppAssets.privacyPolicy,
        ),
      AboutDestination.licenses => LicensePage(
          applicationName: L10n.of(context).appName,
          applicationVersion: viewModel.version,
          applicationIcon: CircleAvatar(
            child: SvgPicture.asset(AppAssets.logo),
          ),
        ),
      _ => EmptyPage(
          emoji: Emoji.about,
          text: L10n.of(context).aboutPageNoPageSelectedLabel,
        ),
    };
  }
}
