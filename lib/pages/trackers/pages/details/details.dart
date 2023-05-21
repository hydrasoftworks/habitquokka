import 'package:flutter/material.dart';

import 'package:cached_network_image/cached_network_image.dart';

import 'package:habit_quokka/models/tracker.dart';
import 'package:habit_quokka/pages/trackers/pages/details/widgets/windows.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({
    super.key,
    required this.tracker,
  });

  final Tracker tracker;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
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
