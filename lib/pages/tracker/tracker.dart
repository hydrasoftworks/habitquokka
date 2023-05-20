import 'package:flutter/material.dart';

import 'package:cached_network_image/cached_network_image.dart';

import 'package:habit_quokka/models/tracker.dart';
import 'package:habit_quokka/pages/tracker/widgets/windows.dart';

class TrackerPage extends StatelessWidget {
  const TrackerPage({
    super.key,
    required this.tracker,
  });

  final Tracker tracker;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
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
    );
  }
}
