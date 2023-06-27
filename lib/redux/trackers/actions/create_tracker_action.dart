import 'package:flutter/material.dart' show NetworkImage;

import 'package:habitquokka/helpers/seed_color.dart';
import 'package:habitquokka/models/exception_code.dart';
import 'package:habitquokka/models/tracker.dart';
import 'package:habitquokka/models/tracker_image.dart';
import 'package:habitquokka/redux/redux.dart';
import 'package:habitquokka/redux/trackers/actions/get_trackers_action.dart';

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
      throw const UserException(
        'User not logged in.',
        code: AppExceptionCode(Code.createTrackerActionUserNotLoggedIn),
      );
    }

    final response =
        await env.supabase.functions.invoke('get-random-unsplash-photo');

    final trackerImage = TrackerImage.fromJson(response.data);

    final seedColor = await seedColorFromImageProvider(
      NetworkImage(trackerImage.imageUrl),
    );

    final tracker = Tracker(
      id: 'new-tracker',
      ownerId: userId,
      shortName: shortName,
      name: name,
      image: trackerImage,
      seedColor: seedColor.value,
      updatedAt: DateTime.now(),
      createdAt: DateTime.now(),
    );

    final createdTrackerData = await env.supabase
        .from('trackers')
        .insert(tracker.toJson())
        .select()
        .single();

    final createdTracker = Tracker.fromJson(createdTrackerData);

    return state.copyWith(
      trackersState: trackersState.copyWith(
        trackerCreatedEvt: Event<String>(createdTracker.id),
      ),
    );
  }

  @override
  void after() {
    dispatch(GetTrackersAction());
  }
}
