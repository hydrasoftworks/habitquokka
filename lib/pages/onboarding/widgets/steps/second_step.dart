import 'package:flutter/material.dart';

import 'package:habitquokka/l10n/l10n.dart';
import 'package:habitquokka/models/tracker.dart';
import 'package:habitquokka/pages/onboarding/widgets/theme_wrapper.dart';
import 'package:habitquokka/theme/theme.dart';
import 'package:habitquokka/widgets/tracker_widget/tracker_widget.dart';

class SecondStepMobile extends StatelessWidget {
  const SecondStepMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(Theme.of(context).appSpacing.small),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _DescriptionWidget(
            textStyle: Theme.of(context).textTheme.bodyLarge,
          ),
          SizedBox(height: Theme.of(context).appSpacing.medium),
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
      padding: EdgeInsets.all(Theme.of(context).appSpacing.large),
      child: Row(
        children: [
          const Expanded(
            flex: 5,
            child: Center(child: _TrackerWidget()),
          ),
          SizedBox(width: Theme.of(context).appSpacing.medium),
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
      L10n.of(context).onboardingStep2Description,
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
