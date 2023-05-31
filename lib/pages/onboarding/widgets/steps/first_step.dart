import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

import 'package:habitquokka/models/tracker.dart';
import 'package:habitquokka/pages/onboarding/widgets/theme_wrapper.dart';
import 'package:habitquokka/widgets/tracker_widget/tracker_widget.dart';

class FirstStepMobile extends StatelessWidget {
  const FirstStepMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _TitleWidget(
            textStyle: Theme.of(context).textTheme.displaySmall,
          ),
          const SizedBox(height: 48),
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

class FirstStepDesktop extends StatelessWidget {
  const FirstStepDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _TitleWidget(
            textStyle: Theme.of(context).textTheme.displayLarge,
          ),
          const SizedBox(height: 48),
          Row(
            children: [
              Expanded(
                flex: 4,
                child: _DescriptionWidget(
                  textStyle: Theme.of(context).textTheme.headlineSmall,
                ),
              ),
              const SizedBox(width: 24),
              const Expanded(
                flex: 5,
                child: _TrackerWidget(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _TitleWidget extends StatelessWidget {
  const _TitleWidget({
    this.textStyle,
  });

  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return SelectableText(
      'Habit Quokka',
      style: GoogleFonts.lilitaOne(
        textStyle: textStyle,
        color: Theme.of(context).colorScheme.onPrimaryContainer,
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
      'Welcome to Habit Quokka – the fun habit tracking app inspired by advent calendars! Create a tracker for any habit you want to follow and start building good habits today.',
      style: textStyle?.copyWith(
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
