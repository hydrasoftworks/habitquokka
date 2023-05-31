import 'package:flutter/material.dart';

import 'package:habitquokka/models/tracker.dart';
import 'package:habitquokka/pages/onboarding/widgets/theme_wrapper.dart';
import 'package:habitquokka/widgets/tracker_widget/tracker_widget.dart';

class SecondStepMobile extends StatelessWidget {
  const SecondStepMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _DescriptionWidget(
            textStyle: Theme.of(context).textTheme.bodyLarge,
          ),
          const SizedBox(height: 24),
          const _TrackerWidget(),
        ],
      ),
    );
  }
}

class SecondStepDesktop extends StatelessWidget {
  const SecondStepDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Row(
        children: [
          const Expanded(
            flex: 5,
            child: _TrackerWidget(),
          ),
          const SizedBox(width: 24),
          Expanded(
            flex: 4,
            child: _DescriptionWidget(
              textStyle: Theme.of(context).textTheme.headlineSmall,
            ),
          ),
        ],
      ),
    );
  }
}

class _DescriptionWidget extends StatelessWidget {
  const _DescriptionWidget({this.textStyle});

  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return SelectableText(
      'Every time you perform the habit, you get to open a window on the grid. Keep up with your habits and open all the windows to reveal the full image.\nIt\'s like a game that rewards you for building good habits!',
      style: textStyle?.copyWith(
        color: Theme.of(context).colorScheme.onPrimaryContainer,
      ),
    );
  }
}

class _TrackerWidget extends StatelessWidget {
  const _TrackerWidget();

  static const int _seedColor = 0xFFb3e2a2;

  @override
  Widget build(BuildContext context) {
    return const ThemeWrapper(
      seedColor: Color(_seedColor),
      child: TrackerWidget(
        tracker: Tracker(
          id: 'TEST2',
          shortName: 'Japanese',
          name: 'Learn Japanese every other day',
          image:
              'https://images.unsplash.com/photo-1526481280693-3bfa7568e0f3?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=3542&q=80',
          rows: 5,
          columns: 6,
          seedColor: _seedColor,
        ),
      ),
    );
  }
}
