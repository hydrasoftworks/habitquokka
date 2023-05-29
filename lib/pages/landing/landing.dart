import 'package:flutter/material.dart';

import 'package:habitquokka/pages/landing/widgets/change_page_button.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  late PageController _pageController;
  final int _numberOfPages = 3;
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
      body: Stack(
        fit: StackFit.expand,
        children: [
          PageView(
            controller: _pageController,
            scrollDirection: Axis.vertical,
            children: [
              Container(
                color: Colors.yellow,
              ),
              Container(
                color: Colors.red,
              ),
              Container(
                color: Colors.green,
              ),
            ],
          ),
          if (_visiblePage < _numberOfPages - 1)
            Align(
              alignment: Alignment.bottomCenter,
              child: NextPageButton(
                onPressed: () => _pageController.nextPage(
                  duration: const Duration(seconds: 1),
                  curve: Curves.easeIn,
                ),
              ),
            ),
          if (_visiblePage > 0)
            Align(
              alignment: Alignment.topCenter,
              child: PreviousPageButton(
                onPressed: () => _pageController.previousPage(
                  duration: const Duration(seconds: 1),
                  curve: Curves.easeIn,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
