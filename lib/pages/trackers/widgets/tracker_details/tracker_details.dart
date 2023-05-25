import 'package:flutter/material.dart';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:go_router/go_router.dart';

import 'package:habitquokka/models/destination.dart';
import 'package:habitquokka/models/tracker.dart';
import 'package:habitquokka/pages/trackers/widgets/tracker_details/widgets/windows.dart';
import 'package:habitquokka/widgets/panel_container.dart';

class TrackerDetails extends StatelessWidget {
  const TrackerDetails({
    super.key,
    required this.tracker,
  });

  final Tracker tracker;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(tracker.name),
        leading: BackButton(
          onPressed: () => GoRouter.of(context).go(Destination.trackers.path),
        ),
      ),
      body: PanelContainer(
        surfaceColor: SurfaceColor.surfaceContainer,
        padding: PanelContainer.defaultPadding.copyWith(
          top: 0,
          left: PanelContainer.defaultPadding.left / 2,
        ),
        child: Center(
          child: AspectRatio(
            aspectRatio: tracker.columns / tracker.rows,
            child: Stack(
              fit: StackFit.expand,
              children: [
                CachedNetworkImage(
                  imageUrl: tracker.image,
                  fit: BoxFit.cover,
                ),
                Windows(
                  rows: tracker.rows,
                  columns: tracker.columns,
                  seed: tracker.id.hashCode,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
