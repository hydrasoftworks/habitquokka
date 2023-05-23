import 'package:flutter/material.dart';

import 'package:habit_quokka/models/tracker.dart';
import 'package:habit_quokka/widgets/material_container.dart';

class ListPage extends StatelessWidget {
  const ListPage({
    super.key,
    required this.trackers,
    required this.onTrackerSelected,
  });

  final List<Tracker> trackers;
  final void Function(Tracker) onTrackerSelected;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MaterialContainer(
        surfaceColor: SurfaceColor.surfaceContainer,
        child: ListView.builder(
          itemCount: trackers.length,
          itemBuilder: (context, index) {
            final tracker = trackers[index];
            return ListTile(
              title: Text(
                tracker.name,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              onTap: () => onTrackerSelected(tracker),
            );
          },
        ),
      ),
    );
  }
}
