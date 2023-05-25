import 'package:flutter/material.dart';

import 'package:habitquokka/models/tracker.dart';
import 'package:habitquokka/widgets/panel_container.dart';

class TrackersList extends StatelessWidget {
  const TrackersList({
    super.key,
    required this.trackers,
    required this.selectedTrackerId,
    required this.onTrackerSelected,
  });

  final List<Tracker> trackers;
  final String? selectedTrackerId;
  final void Function(Tracker) onTrackerSelected;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PanelContainer(
        surfaceColor: SurfaceColor.surfaceContainerLow,
        padding: PanelContainer.defaultPadding.copyWith(
          right: PanelContainer.defaultPadding.right / 2,
        ),
        child: ListView.builder(
          itemCount: trackers.length,
          itemBuilder: (context, index) {
            final tracker = trackers[index];
            return ListTile(
              selected: tracker.id == selectedTrackerId,
              onTap: () => onTrackerSelected(tracker),
              title: Text(
                tracker.name,
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
