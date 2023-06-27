import 'package:flutter/material.dart' show NetworkImage, DateUtils;

import 'package:habitquokka/helpers/seed_color.dart';
import 'package:habitquokka/models/exception_code.dart';
import 'package:habitquokka/models/tracker.dart';
import 'package:habitquokka/models/tracker_image.dart';
import 'package:habitquokka/redux/redux.dart';
import 'package:habitquokka/redux/trackers/actions/get_trackers_action.dart';

class RegenerateTrackerImageAction extends Action {
  RegenerateTrackerImageAction({
    required this.tracker,
  });

  final Tracker tracker;

  @override
  Future<AppState?> reduce() async {
    if (DateUtils.isSameDay(tracker.image.createdAt, DateTime.now())) {
      throw const UserException(
        'Tracker image can be regenerated only once per day.',
        code: AppExceptionCode(Code.regenerateImageAPIUsageLimit),
      );
    }

    final response =
        await env.supabase.functions.invoke('get-random-unsplash-photo');

    final trackerImage = TrackerImage.fromJson(response.data);

    final seedColor = await seedColorFromImageProvider(
      NetworkImage(trackerImage.imageUrl),
    );

    await env.supabase.from('trackers').update({
      'image': trackerImage.toJson(),
      'seed_color': seedColor.value,
      'updated_at': DateTime.now().toIso8601String(),
    }).eq('id', tracker.id);

    return null;
  }

  @override
  void after() {
    dispatch(GetTrackersAction());
  }
}
