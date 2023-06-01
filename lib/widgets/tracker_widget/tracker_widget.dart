import 'package:flutter/material.dart';

import 'package:cached_network_image/cached_network_image.dart';

import 'package:habitquokka/models/tracker.dart';
import 'package:habitquokka/widgets/tracker_widget/widgets/windows.dart';

class TrackerWidget extends StatelessWidget {
  const TrackerWidget({
    super.key,
    required this.tracker,
  });
  final Tracker tracker;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
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
    );
  }
}
