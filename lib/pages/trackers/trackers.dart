import 'package:flutter/material.dart';

import 'package:adaptive_theme/adaptive_theme.dart';

import 'package:habit_quokka/models/tracker.dart';

class TrackersPage extends StatelessWidget {
  const TrackersPage({
    super.key,
    required this.onTrackerSelected,
  });

  final void Function(Tracker) onTrackerSelected;

  final List<Tracker> _trackers = const [
    Tracker(
      id: 'TEST1',
      name: 'Water',
      image: 'https://picsum.photos/500?image=9',
      rows: 5,
      columns: 6,
      seedColor: 0x0D47A1,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _trackers.length,
      itemBuilder: (context, index) {
        final tracker = _trackers[index];
        return ListTile(
          title: Text(
            tracker.name,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          onTap: () {
            _changeTheme(context, tracker.seedColor);
            onTrackerSelected(tracker);
          },
        );
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
