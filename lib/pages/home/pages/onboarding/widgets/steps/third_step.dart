import 'package:flutter/material.dart';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import 'package:habitquokka/l10n/l10n.dart';
import 'package:habitquokka/router/route.dart';
import 'package:habitquokka/theme/theme.dart';

class ThirdStepMobile extends StatelessWidget {
  const ThirdStepMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(Theme.of(context).appSpacing.small),
      child: Column(
        children: [
          _DescriptionWidget(
            textStyle: Theme.of(context).textTheme.bodyLarge,
          ),
          SizedBox(height: Theme.of(context).appSpacing.medium),
          const Flexible(child: _CTAWidget()),
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
            flex: 4,
            child: _DescriptionWidget(
              textStyle: Theme.of(context).textTheme.headlineSmall,
            ),
          ),
          SizedBox(height: Theme.of(context).appSpacing.large),
          const Expanded(
            flex: 5,
            child: _CTAWidget(),
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
    return SelectionArea(
      child: AutoSizeText(
        L10n.of(context).onboardingStep3DescriptionLabel,
        style: textStyle?.copyWith(
          color: Theme.of(context).colorScheme.onPrimaryContainer,
        ),
      ),
    );
  }
}

class _CTAWidget extends StatelessWidget {
  const _CTAWidget();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: 300,
          height: 300,
          child: CircleAvatar(
            child: SvgPicture.asset('assets/logo.svg'),
          ),
        ),
        FilledButton(
          onPressed: () => GoRouter.of(context).go(AppRoute.trackers),
          style: FilledButton.styleFrom(
            textStyle: Theme.of(context).textTheme.headlineSmall,
            visualDensity: VisualDensity.standard,
          ),
          child: Text(L10n.of(context).onboardingStep3CTAButtonLabel),
        ),
      ],
    );
  }
}
