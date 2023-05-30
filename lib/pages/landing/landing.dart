import 'package:flutter/material.dart';

import 'package:habitquokka/pages/landing/widgets/landing_step.dart';
import 'package:habitquokka/pages/landing/widgets/steps/first_step.dart';
import 'package:habitquokka/pages/landing/widgets/theme_wrapper.dart';
import 'package:habitquokka/theme.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  late PageController _pageController;
  int _visiblePage = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _visiblePage);
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
      body: PageView(
        controller: _pageController,
        scrollDirection: Axis.vertical,
        children: [
          ThemeWrapper(
            seedColor: AppTheme.mainColor,
            child: LandingStep(
              onPreviousPressed: null,
              onNextPressed: _onNextPressed,
              mobile: (_) => const FirstStepMobile(),
              desktop: (_) => const FirstStepDesktop(),
            ),
          ),
          ThemeWrapper(
            seedColor: const Color(0xFFeff4e2),
            child: LandingStep(
              onPreviousPressed: _onPreviousPressed,
              onNextPressed: _onNextPressed,
              mobile: (_) => const FirstStepMobile(),
              desktop: (_) => const FirstStepDesktop(),
            ),
          ),
          ThemeWrapper(
            seedColor: const Color(0xFFffb3e2),
            child: LandingStep(
              onPreviousPressed: _onPreviousPressed,
              onNextPressed: null,
              mobile: (_) => const FirstStepMobile(),
              desktop: (_) => const FirstStepDesktop(),
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
