import 'dart:math' as math;

import 'package:flutter/material.dart';

import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:go_router/go_router.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'package:habitquokka/l10n/l10n.dart';
import 'package:habitquokka/models/emoji.dart';
import 'package:habitquokka/models/tracker.dart';
import 'package:habitquokka/pages/empty/empty.dart';
import 'package:habitquokka/pages/home/pages/trackers/pages/tracker_details/tracker_details.dart';
import 'package:habitquokka/pages/home/pages/trackers/pages/trackers_list/trackers_list.dart';
import 'package:habitquokka/pages/home/pages/trackers/view_model.dart';
import 'package:habitquokka/router/route.dart';
import 'package:habitquokka/widgets/panel_container.dart';

class TrackersPage extends StatelessWidget {
  const TrackersPage({
    super.key,
    required this.viewModel,
  });

  final ViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      mobile: _buildSinglePage,
      desktop: _buildSplitPage,
    );
  }

  Widget _buildSinglePage(BuildContext context) {
    final selectedTracker = viewModel.selectedTracker;
    if (selectedTracker != null) {
      return _buildTrackerDetails(
        context,
        tracker: selectedTracker,
        isSplitPage: false,
      );
    }
    return _buildTrackersList(
      context,
      selectedTracker: selectedTracker,
      isSplitPage: false,
    );
  }

  Widget _buildSplitPage(BuildContext context) {
    final selectedTracker = viewModel.selectedTracker;
    return Scaffold(
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            width: math.max(30.screenWidth, 300),
            child: _buildTrackersList(
              context,
              selectedTracker: selectedTracker,
              isSplitPage: true,
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(
                top: PanelContainer.defaultPadding.top,
              ),
              child: selectedTracker != null
                  ? _buildTrackerDetails(
                      context,
                      tracker: selectedTracker,
                      isSplitPage: true,
                    )
                  : EmptyPage(
                      emoji: Emoji.emptyTracker,
                      text: L10n.of(context).trackersPageNoTrackerSelectedLabel,
                    ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTrackersList(
    BuildContext context, {
    required Tracker? selectedTracker,
    required bool isSplitPage,
  }) {
    return TrackersListPage(
      onTrackerSelected: (tracker) {
        GoRouter.of(context).go(AppRoute.trackerDetails(tracker.id));
      },
      trackers: viewModel.trackers,
      selectedTracker: selectedTracker,
      padding: PanelContainer.rightPadding(isSplitPage: isSplitPage),
    );
  }

  Widget _buildTrackerDetails(
    BuildContext context, {
    required Tracker tracker,
    required bool isSplitPage,
  }) {
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) => _changeTheme(context, tracker.seedColor),
    );

    final padding = PanelContainer.leftPadding(isSplitPage: isSplitPage);

    return TrackerDetailsPageConnector(
      key: ValueKey('$TrackerDetailsPageConnector-${tracker.id}'),
      tracker: tracker,
      padding: padding,
    );
  }

  void _changeTheme(BuildContext context, int seedColor) {
    final color = Color(seedColor);

    AdaptiveTheme.of(context).setTheme(
      light: ThemeData.from(
        colorScheme: ColorScheme.fromSeed(
          seedColor: color,
        ),
        useMaterial3: true,
      ),
      dark: ThemeData.from(
        colorScheme: ColorScheme.fromSeed(
          seedColor: color,
          brightness: Brightness.dark,
        ),
        useMaterial3: true,
      ),
    );
  }
}
