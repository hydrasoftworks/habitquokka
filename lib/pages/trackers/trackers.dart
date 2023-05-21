import 'package:flutter/material.dart';

import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:go_router/go_router.dart';

import 'package:habit_quokka/models/destination.dart';
import 'package:habit_quokka/models/tracker.dart';
import 'package:habit_quokka/pages/trackers/pages/list/list.dart';

class TrackersPage extends StatelessWidget {
  const TrackersPage({super.key});

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
    return ListPage(
      trackers: _trackers,
      onTrackerSelected: (tracker) {
        _changeTheme(context, tracker.seedColor);
        GoRouter.of(context).go('${Destination.trackers.path}/${tracker.id}');
      },
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
