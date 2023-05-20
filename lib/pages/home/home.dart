import 'package:flutter/material.dart';

import 'package:flutter_adaptive_scaffold/flutter_adaptive_scaffold.dart';

import 'package:habit_quokka/models/tracker.dart';
import 'package:habit_quokka/pages/tracker/tracker.dart';
import 'package:habit_quokka/pages/trackers/trackers.dart';

enum _Page {
  home,
  tracker;

  bool get splitScreen => this == _Page.tracker;
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  _Page _selectedPage = _Page.home;
  Tracker? _selectedTracker;

  @override
  Widget build(BuildContext context) {
    return AdaptiveScaffold(
      selectedIndex: _selectedPage.index,
      onSelectedIndexChange: (int index) {
        setState(() => _selectedPage = _Page.values[index]);
      },
      bodyRatio: 0.15,
      useDrawer: false,
      destinations: const <NavigationDestination>[
        NavigationDestination(
          icon: Icon(Icons.inbox_outlined),
          selectedIcon: Icon(Icons.inbox),
          label: 'Inbox',
        ),
        NavigationDestination(
          icon: Icon(Icons.article_outlined),
          selectedIcon: Icon(Icons.article),
          label: 'Habit Trackers',
        ),
      ],
      body: _buildBody,
      smallSecondaryBody: AdaptiveScaffold.emptyBuilder,
      secondaryBody: _selectedPage.splitScreen ? _buildTrackerPage : null,
    );
  }

  Widget _buildBody(BuildContext context) {
    switch (_selectedPage) {
      case _Page.home:
        return const Center(child: Text('Inbox'));
      case _Page.tracker:
        return TrackersPage(
          onTrackerSelected: (tracker) => setState(
            () => _selectedTracker = tracker,
          ),
        );
    }
  }

  Widget _buildTrackerPage(BuildContext context) {
    final tracker = _selectedTracker;
    if (tracker != null) {
      return TrackerPage(tracker: tracker);
    }
    return const Center(child: Text('Select a tracker'));
  }
}
