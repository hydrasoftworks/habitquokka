import 'package:flutter/material.dart';

import 'package:responsive_builder/responsive_builder.dart';

import 'package:habitquokka/pages/home/pages/onboarding/widgets/change_page_button.dart';
import 'package:habitquokka/widgets/panel_container.dart';

typedef WidgetBuilder = Widget Function(BuildContext);

class OnboardingStep extends StatelessWidget {
  const OnboardingStep({
    super.key,
    required this.onPreviousPressed,
    required this.onNextPressed,
    required this.mobile,
    required this.desktop,
  });

  final VoidCallback? onPreviousPressed;
  final VoidCallback? onNextPressed;
  final WidgetBuilder mobile;
  final WidgetBuilder desktop;

  @override
  Widget build(BuildContext context) {
    final onPreviousPressed = this.onPreviousPressed;
    final onNextPressed = this.onNextPressed;

    return Stack(
      fit: StackFit.expand,
      children: [
        PanelContainer(
          customColor: Theme.of(context).colorScheme.primaryContainer,
          child: ScreenTypeLayout.builder(
            mobile: mobile,
            desktop: desktop,
          ),
        ),
        if (onPreviousPressed != null)
          Align(
            alignment: Alignment.topCenter,
            child: PreviousPageButton(
              onPressed: onPreviousPressed,
            ),
          ),
        if (onNextPressed != null)
          Align(
            alignment: Alignment.bottomCenter,
            child: NextPageButton(
              onPressed: onNextPressed,
            ),
          ),
      ],
    );
  }
}
