import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';

import 'package:habitquokka/models/home_destination.dart';
import 'package:habitquokka/models/tracker.dart';
import 'package:habitquokka/widgets/panel_container.dart';
import 'package:habitquokka/widgets/tracker_widget/tracker_widget.dart';

class TrackerDetailsPage extends StatelessWidget {
  const TrackerDetailsPage({
    super.key,
    required this.tracker,
    required this.padding,
  });

  final Tracker tracker;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          tracker.name,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        leading: BackButton(
          onPressed: () =>
              GoRouter.of(context).go(HomeDestination.trackers.path),
        ),
      ),
      body: PanelContainer(
        surfaceColor: SurfaceColor.surfaceContainer,
        padding: padding,
        child: Center(
          child: TrackerWidget(
            tracker: tracker,
          ),
        ),
      ),
    );
  }
}
