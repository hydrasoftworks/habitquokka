import 'package:flutter/material.dart';

import 'package:auto_size_text/auto_size_text.dart';

import 'package:habitquokka/models/tracker.dart';
import 'package:habitquokka/pages/landing/widgets/theme_wrapper.dart';
import 'package:habitquokka/widgets/tracker_widget/tracker_widget.dart';

class FirstStepMobile extends StatelessWidget {
  const FirstStepMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(12),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _TitleWidget(),
          SizedBox(height: 48),
          _DescriptionWidget(),
          SizedBox(height: 24),
          _TrackerWidget(),
        ],
      ),
    );
  }
}

class FirstStepDesktop extends StatelessWidget {
  const FirstStepDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _TitleWidget(),
          SizedBox(height: 48),
          Row(
            children: [
              Expanded(child: _DescriptionWidget()),
              SizedBox(width: 24),
              Expanded(child: _TrackerWidget()),
            ],
          ),
        ],
      ),
    );
  }
}

class _TitleWidget extends StatelessWidget {
  const _TitleWidget();

  @override
  Widget build(BuildContext context) {
    return AutoSizeText(
      'Habit Quokka',
      style: Theme.of(context).textTheme.displayLarge?.copyWith(
            color: Theme.of(context).colorScheme.onPrimaryContainer,
          ),
    );
  }
}

class _DescriptionWidget extends StatelessWidget {
  const _DescriptionWidget();

  @override
  Widget build(BuildContext context) {
    return AutoSizeText(
      'Welcome to Habit Quokka – the fun habit tracking app inspired by advent calendars! Create a tracker for any habit you want to follow and start building good habits today.',
      style: Theme.of(context).textTheme.headlineSmall?.copyWith(
            color: Theme.of(context).colorScheme.onPrimaryContainer,
          ),
    );
  }
}

class _TrackerWidget extends StatelessWidget {
  const _TrackerWidget();

  static const int _seedColor = 0xFF0b2e3d;

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
