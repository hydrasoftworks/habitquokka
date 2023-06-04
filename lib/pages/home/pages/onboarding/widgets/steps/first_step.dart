import 'package:flutter/material.dart';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:habitquokka/l10n/l10n.dart';
import 'package:habitquokka/pages/home/pages/onboarding/widgets/steps/example_tracker_widget.dart';
import 'package:habitquokka/theme/theme.dart';

const int _seedColor = 0xFF0b2e3d;

class FirstStepMobile extends StatelessWidget {
  const FirstStepMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(Theme.of(context).appSpacing.small),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _TitleWidget(
            textStyle: Theme.of(context).textTheme.displaySmall,
          ),
          SizedBox(height: Theme.of(context).appSpacing.medium),
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

class FirstStepDesktop extends StatelessWidget {
  const FirstStepDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(Theme.of(context).appSpacing.large),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _TitleWidget(
            textStyle: Theme.of(context).textTheme.displayLarge,
          ),
          SizedBox(height: Theme.of(context).appSpacing.large),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  flex: 4,
                  child: _DescriptionWidget(
                    textStyle: Theme.of(context).textTheme.headlineSmall,
                  ),
                ),
                SizedBox(width: Theme.of(context).appSpacing.large),
                const Expanded(
                  flex: 5,
                  child: Center(
                    child: ExampleTrackerWidget(seedColor: _seedColor),
                  ),
                ),
              ],
            ),
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
    return SelectionArea(
      child: AutoSizeText(
        L10n.of(context).appName,
        minFontSize: 14,
        style: GoogleFonts.lilitaOne(
          textStyle: textStyle,
          color: Theme.of(context).colorScheme.onPrimaryContainer,
        ),
      ),
    );
  }
}

class _DescriptionWidget extends StatelessWidget {
  const _DescriptionWidget({this.textStyle});

  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return AutoSizeText(
      L10n.of(context).onboardingPageStep1DescriptionLabel,
      style: textStyle?.copyWith(
        color: Theme.of(context).colorScheme.onPrimaryContainer,
      ),
    );
  }
}
