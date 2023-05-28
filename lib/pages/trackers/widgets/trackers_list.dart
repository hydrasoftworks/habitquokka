import 'package:flutter/material.dart';

import 'package:habitquokka/models/tracker.dart';
import 'package:habitquokka/widgets/panel_container.dart';

class TrackersList extends StatelessWidget {
  const TrackersList({
    super.key,
    required this.trackers,
    required this.selectedTrackerId,
    required this.padding,
    required this.onTrackerSelected,
  });

  final List<Tracker> trackers;
  final String? selectedTrackerId;
  final EdgeInsets padding;
  final void Function(Tracker) onTrackerSelected;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PanelContainer(
        surfaceColor: SurfaceColor.surfaceContainerLow,
        padding: padding,
        child: ListView.builder(
          itemCount: trackers.length,
          itemBuilder: (context, index) {
            final tracker = trackers[index];
            return ListTile(
              selected: tracker.id == selectedTrackerId,
              onTap: () => onTrackerSelected(tracker),
              title: Text(
                tracker.shortName,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            );
          },
        ),
      ),
    );
  }
}
