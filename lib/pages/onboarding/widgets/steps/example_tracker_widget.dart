import 'package:flutter/material.dart';

import 'package:habitquokka/models/tracker.dart';
import 'package:habitquokka/models/tracker_image.dart';
import 'package:habitquokka/pages/onboarding/widgets/theme_wrapper.dart';
import 'package:habitquokka/widgets/tracker_widget/tracker_widget.dart';

class ExampleTrackerWidget extends StatelessWidget {
  const ExampleTrackerWidget({
    super.key,
    required this.seedColor,
  });

  final int seedColor;

  @override
  Widget build(BuildContext context) {
    return ThemeWrapper(
      seedColor: Color(seedColor),
      child: TrackerWidget(
        tracker: Tracker(
          id: 'Onboarding',
          shortName: 'Habit Quokka',
          name: 'Check out Habit Quokka!',
          image: const TrackerImage(
            source: ImageSource.unsplash,
            rawUrl:
                'https://images.unsplash.com/photo-1571164330912-270c6d07e212?crop=entropy&cs=srgb&fm=jpg&ixid=M3wyMTI5MzR8MHwxfHJhbmRvbXx8fHx8fHx8fDE2ODU3OTUzODF8&ixlib=rb-4.0.3&q=85',
            pageUrl: 'https://unsplash.com/photos/dXdkpdYCNbo',
            author: 'Luca Bravo',
          ),
          rows: 5,
          columns: 6,
          seedColor: seedColor,
        ),
      ),
    );
  }
}
