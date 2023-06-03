import 'package:flutter/material.dart';

import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:go_router/go_router.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'package:habitquokka/l10n/l10n.dart';
import 'package:habitquokka/models/emoji.dart';
import 'package:habitquokka/models/home_destination.dart';
import 'package:habitquokka/models/tracker.dart';
import 'package:habitquokka/models/tracker_image.dart';
import 'package:habitquokka/pages/empty/empty.dart';
import 'package:habitquokka/pages/trackers/widgets/tracker_details/tracker_details.dart';
import 'package:habitquokka/pages/trackers/widgets/trackers_list.dart';
import 'package:habitquokka/widgets/panel_container.dart';

class TrackersPage extends StatelessWidget {
  const TrackersPage({
    super.key,
    required this.selectedTrackerId,
  });

  final String? selectedTrackerId;
  final List<Tracker> _trackers = const [
    Tracker(
      id: 'Onboarding',
      shortName: 'Habit Quokka',
      name: 'Check out Habit Quokka!',
      image: TrackerImage(
        source: ImageSource.unsplash,
        rawUrl:
            'https://images.unsplash.com/photo-1571164330912-270c6d07e212?crop=entropy&cs=srgb&fm=jpg&ixid=M3wyMTI5MzR8MHwxfHJhbmRvbXx8fHx8fHx8fDE2ODU3OTUzODF8&ixlib=rb-4.0.3&q=85',
        pageUrl: 'https://unsplash.com/photos/dXdkpdYCNbo',
        author: 'Luca Bravo',
      ),
      rows: 5,
      columns: 6,
      seedColor: 0x0D47A1,
    )
  ];

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
            width: 30.screenWidth,
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
                      text: L10n.of(context).trackersNoTrackerSelected,
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
    return TrackersList(
      onTrackerSelected: (tracker) {
        GoRouter.of(context)
            .go('${HomeDestination.trackers.path}/${tracker.id}');
      },
      trackers: _trackers,
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
    final tracker = _trackers.firstWhere(
      (tracker) => tracker.id == selectedTrackerId,
    );
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) => _changeTheme(context, tracker.seedColor),
    );

    return TrackerDetails(
      key: ValueKey('$TrackerDetails-${tracker.id}'),
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
