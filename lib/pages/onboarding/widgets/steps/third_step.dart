import 'package:flutter/material.dart';

import 'package:habitquokka/l10n/l10n.dart';
import 'package:habitquokka/theme/theme.dart';

class ThirdStepMobile extends StatelessWidget {
  const ThirdStepMobile({super.key});

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
        ],
      ),
    );
  }
}

class ThirdStepDesktop extends StatelessWidget {
  const ThirdStepDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(Theme.of(context).appSpacing.large),
      child: Row(
        children: [
          Expanded(
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
      L10n.of(context).onboardingStep3Description,
      style: textStyle?.copyWith(
        color: Theme.of(context).colorScheme.onPrimaryContainer,
      ),
    );
  }
}
