import 'package:flutter/material.dart' show NetworkImage;

import 'package:habitquokka/models/seed_color.dart';
import 'package:habitquokka/models/tracker.dart';
import 'package:habitquokka/models/tracker_image.dart';
import 'package:habitquokka/redux/redux.dart';

class CreateTrackerAction extends Action {
  CreateTrackerAction({
    required this.name,
    required this.shortName,
  });

  final String? name;
  final String shortName;

  @override
  Future<AppState?> reduce() async {
    final userId = env.supabase.auth.currentUser?.id;
    if (userId == null) {
      throw const UserException('You must be logged in to create a tracker.');
    }

    final response =
        await env.supabase.functions.invoke('get-random-unsplash-photo');

    final trackerImage = TrackerImage.fromJson(response.data);

    // TODO: This operations blocks UI. Should be callend in an isolate.
    final seedColor = await seedColorFromImageProvider(
      NetworkImage(trackerImage.rawUrl),
    );

    final tracker = Tracker(
      id: 'new-tracker',
      ownerId: userId,
      shortName: shortName,
      name: name,
      image: trackerImage,
      seedColor: seedColor.value,
    );

    final createdTrackerData = await env.supabase
        .from('trackers')
        .insert(tracker.toJson())
        .select()
        .single();

    final createdTracker = Tracker.fromJson(createdTrackerData);

    return state.copyWith(
      trackersState: trackersState.copyWith(
        trackers: [createdTracker, ...trackersState.trackers],
      ),
    );
  }
}
