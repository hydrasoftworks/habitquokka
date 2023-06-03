import 'package:flutter/material.dart';

import 'package:habitquokka/l10n/l10n.dart';
import 'package:habitquokka/pages/onboarding/widgets/steps/example_tracker_widget.dart';
import 'package:habitquokka/theme/theme.dart';

const int _seedColor = 0xFFb3e2a2;

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
          const ExampleTrackerWidget(seedColor: _seedColor),
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
            child: Center(child: ExampleTrackerWidget(seedColor: _seedColor)),
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
      L10n.of(context).onboardingPageStep2DescriptionLabel,
      style: textStyle?.copyWith(
        color: Theme.of(context).colorScheme.onPrimaryContainer,
      ),
    );
  }
}
