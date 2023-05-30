import 'package:flutter/material.dart';

import 'package:responsive_builder/responsive_builder.dart';

import 'package:habitquokka/pages/landing/widgets/change_page_button.dart';
import 'package:habitquokka/widgets/panel_container.dart';

class LandingStep extends StatelessWidget {
  const LandingStep({
    super.key,
    required this.onPreviousPressed,
    required this.onNextPressed,
  });

  final VoidCallback? onPreviousPressed;
  final VoidCallback? onNextPressed;

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
            mobile: (context) => const _MobileStep(),
            desktop: (context) => const _DesktopStep(),
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

class _MobileStep extends StatelessWidget {
  const _MobileStep();

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class _DesktopStep extends StatelessWidget {
  const _DesktopStep();

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
