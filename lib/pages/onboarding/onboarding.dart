import 'package:flutter/material.dart';

import 'package:preload_page_view/preload_page_view.dart';

import 'package:habitquokka/pages/onboarding/widgets/onboarding_step.dart';
import 'package:habitquokka/pages/onboarding/widgets/steps/first_step.dart';
import 'package:habitquokka/pages/onboarding/widgets/steps/second_step.dart';
import 'package:habitquokka/pages/onboarding/widgets/steps/third_step.dart';
import 'package:habitquokka/pages/onboarding/widgets/theme_wrapper.dart';
import 'package:habitquokka/theme.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  late PreloadPageController _pageController;
  int _visiblePage = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PreloadPageController(initialPage: _visiblePage);
    _pageController.addListener(() {
      setState(() => _visiblePage = _pageController.page?.toInt() ?? 0);
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PreloadPageView(
        controller: _pageController,
        scrollDirection: Axis.vertical,
        preloadPagesCount: 3,
        children: [
          ThemeWrapper(
            seedColor: AppTheme.mainColor,
            child: OnboardingStep(
              onPreviousPressed: null,
              onNextPressed: _onNextPressed,
              mobile: (_) => const FirstStepMobile(),
              desktop: (_) => const FirstStepDesktop(),
            ),
          ),
          ThemeWrapper(
            seedColor: const Color(0xFFeff4e2),
            child: OnboardingStep(
              onPreviousPressed: _onPreviousPressed,
              onNextPressed: _onNextPressed,
              mobile: (_) => const SecondStepMobile(),
              desktop: (_) => const SecondStepDesktop(),
            ),
          ),
          ThemeWrapper(
            seedColor: const Color(0xFFffb3e2),
            child: OnboardingStep(
              onPreviousPressed: _onPreviousPressed,
              onNextPressed: null,
              mobile: (_) => const ThirdStepMobile(),
              desktop: (_) => const ThirdStepDesktop(),
            ),
          ),
        ],
      ),
    );
  }

  void _onPreviousPressed() {
    _pageController.previousPage(
      duration: const Duration(seconds: 1),
      curve: Curves.easeIn,
    );
  }

  void _onNextPressed() {
    _pageController.nextPage(
      duration: const Duration(seconds: 1),
      curve: Curves.easeIn,
    );
  }
}
