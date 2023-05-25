import 'package:flutter/material.dart';

import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:go_router/go_router.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'package:habitquokka/models/destination.dart';
import 'package:habitquokka/models/tracker.dart';
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
      id: 'TEST1',
      name: 'Water',
      image: 'https://picsum.photos/500?image=9',
      rows: 5,
      columns: 6,
      seedColor: 0x0D47A1,
    ),
    Tracker(
      id: 'TEST2',
      name: 'Japanese',
      image:
          'https://images.unsplash.com/photo-1526481280693-3bfa7568e0f3?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=3542&q=80',
      rows: 5,
      columns: 6,
      seedColor: 0x9edc00,
    ),
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
      return _buildTrackerDetails(context);
    }
    return _buildTrackersList(context);
  }

  Widget _buildSplitPage(BuildContext context) {
    return Scaffold(
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            width: 30.screenWidth,
            child: _buildTrackersList(context),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(
                top: PanelContainer.defaultPadding.top,
              ),
              child: (selectedTrackerId != null)
                  ? _buildTrackerDetails(context)
                  : const Center(child: Text('Select a tracker')),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTrackersList(BuildContext context) {
    return TrackersList(
      trackers: _trackers,
      selectedTrackerId: selectedTrackerId,
      onTrackerSelected: (tracker) {
        GoRouter.of(context).go('${Destination.trackers.path}/${tracker.id}');
      },
    );
  }

  Widget _buildTrackerDetails(BuildContext context) {
    final tracker = _trackers.firstWhere(
      (tracker) => tracker.id == selectedTrackerId,
    );
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) => _changeTheme(context, tracker.seedColor),
    );

    return TrackerDetails(
      key: ValueKey('$TrackerDetails-${tracker.id}'),
      tracker: tracker,
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
