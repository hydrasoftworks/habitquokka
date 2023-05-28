import 'package:flutter/material.dart';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:go_router/go_router.dart';

import 'package:habitquokka/models/home_destination.dart';
import 'package:habitquokka/models/tracker.dart';
import 'package:habitquokka/pages/trackers/widgets/tracker_details/widgets/windows.dart';
import 'package:habitquokka/widgets/panel_container.dart';

class TrackerDetails extends StatelessWidget {
  const TrackerDetails({
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
