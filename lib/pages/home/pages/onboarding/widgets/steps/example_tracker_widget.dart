import 'package:flutter/material.dart';

import 'package:habitquokka/l10n/l10n.dart';
import 'package:habitquokka/models/tracker.dart';
import 'package:habitquokka/models/tracker_image.dart';
import 'package:habitquokka/pages/home/pages/onboarding/widgets/theme_wrapper.dart';
import 'package:habitquokka/widgets/tracker_widget/tracker_widget.dart';

class ExampleTrackerWidget extends StatefulWidget {
  const ExampleTrackerWidget({
    super.key,
    this.opened = const {},
    required this.seedColor,
  });

  final int seedColor;
  final Set<String> opened;

  @override
  State<ExampleTrackerWidget> createState() => _ExampleTrackerWidgetState();
}

class _ExampleTrackerWidgetState extends State<ExampleTrackerWidget> {
  late Set<String> _opened;

  @override
  void initState() {
    super.initState();
    _opened = Set.of(widget.opened);
  }

  @override
  Widget build(BuildContext context) {
    return ThemeWrapper(
      seedColor: Color(widget.seedColor),
      child: TrackerWidget(
        opened: _opened,
        onWindowPressed: (key) => setState(
          () => _opened.contains(key) ? _opened.remove(key) : _opened.add(key),
        ),
        tracker: Tracker(
          id: 'onboarding',
          ownerId: 'onboarding-user',
          shortName: L10n.of(context).onboardingPageTrackerShortName,
          name: L10n.of(context).onboardingPageTrackerName,
          image: const TrackerImage(
            source: ImageSource.unsplash,
            imageUrl:
                'https://images.unsplash.com/photo-1571164330912-270c6d07e212?crop=entropy&cs=srgb&fm=jpg&ixid=M3wyMTI5MzR8MHwxfHJhbmRvbXx8fHx8fHx8fDE2ODU3OTUzODF8&ixlib=rb-4.0.3&q=85',
            pageUrl: 'https://unsplash.com/photos/dXdkpdYCNbo',
            author: 'Luca Bravo',
          ),
          seedColor: widget.seedColor,
        ),
      ),
    );
  }
}
