import 'dart:math' as math;

import 'package:flutter/material.dart';

import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:go_router/go_router.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'package:habitquokka/l10n/l10n.dart';
import 'package:habitquokka/models/emoji.dart';
import 'package:habitquokka/pages/empty/empty.dart';
import 'package:habitquokka/pages/home/pages/trackers/pages/tracker_details/tracker_details.dart';
import 'package:habitquokka/pages/home/pages/trackers/pages/trackers_list/trackers_list.dart';
import 'package:habitquokka/pages/home/pages/trackers/view_model.dart';
import 'package:habitquokka/router/route.dart';
import 'package:habitquokka/widgets/panel_container.dart';

class TrackersPage extends StatelessWidget {
  const TrackersPage({
    super.key,
    required this.selectedTrackerId,
    required this.viewModel,
  });

  final String? selectedTrackerId;
  final ViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      mobile: _buildSinglePage,
      desktop: _buildSplitPage,
    );
  }

  Widget _buildSinglePage(BuildContext context) {
    if (selectedTrackerId != null) {
      return _buildTrackerDetails(context, isSplitPage: false);
    }
    return _buildTrackersList(context, isSplitPage: false);
  }

  Widget _buildSplitPage(BuildContext context) {
    return Scaffold(
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            width: math.max(30.screenWidth, 300),
            child: _buildTrackersList(context, isSplitPage: true),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(
                top: PanelContainer.defaultPadding.top,
              ),
              child: (selectedTrackerId != null)
                  ? _buildTrackerDetails(context, isSplitPage: true)
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
    required bool isSplitPage,
  }) {
    return TrackersListPage(
      onTrackerSelected: (tracker) {
        GoRouter.of(context).go(AppRoute.trackerDetails(tracker.id));
      },
      trackers: viewModel.trackers,
      selectedTrackerId: selectedTrackerId,
      padding: PanelContainer.defaultPadding.copyWith(
        right: isSplitPage ? PanelContainer.defaultPadding.right / 2 : null,
      ),
    );
  }

  Widget _buildTrackerDetails(
    BuildContext context, {
    required bool isSplitPage,
  }) {
    final tracker = viewModel.trackers.firstWhere(
      (tracker) => tracker.id == selectedTrackerId,
    );
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) => _changeTheme(context, tracker.seedColor),
    );

    return TrackerDetailsPage(
      key: ValueKey('$TrackerDetailsPage-${tracker.id}'),
      tracker: tracker,
      padding: PanelContainer.defaultPadding.copyWith(
        top: 0,
        left: isSplitPage ? PanelContainer.defaultPadding.left / 2 : null,
      ),
    );
  }

  void _changeTheme(BuildContext context, int seedColor) {
    final color = Color(seedColor);

    AdaptiveTheme.of(context).setTheme(
      light: ThemeData.from(
        colorScheme: ColorScheme.fromSeed(
          seedColor: color,
          brightness: Brightness.light,
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
