import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';

import 'package:habitquokka/l10n/l10n.dart';
import 'package:habitquokka/models/tracker.dart';
import 'package:habitquokka/router/route.dart';
import 'package:habitquokka/theme/theme.dart';
import 'package:habitquokka/widgets/panel_container.dart';

class TrackersListPage extends StatelessWidget {
  const TrackersListPage({
    super.key,
    required this.trackers,
    required this.selectedTracker,
    required this.padding,
    required this.onTrackerSelected,
  });

  final List<Tracker> trackers;
  final Tracker? selectedTracker;
  final EdgeInsets padding;
  final void Function(Tracker) onTrackerSelected;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PanelContainer(
        surfaceColor: SurfaceColor.surfaceContainerLow,
        padding: padding,
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: trackers.length,
                itemBuilder: (context, index) {
                  final tracker = trackers[index];
                  return ListTile(
                    onTap: () => onTrackerSelected(tracker),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    selected: tracker.id == selectedTracker?.id,
                    title: Text(
                      tracker.shortName,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  );
                },
              ),
            ),
            SizedBox(
              height: Theme.of(context).appSpacing.medium,
            ),
            TextButton.icon(
              onPressed: () => GoRouter.of(context).push(AppRoute.newTracker),
              icon: const Icon(Icons.add),
              label: Text(
                L10n.of(context).trackersListPageNewTrackerButtonLabel,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
