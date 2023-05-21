import 'dart:math' as math;

import 'package:flutter/material.dart';

import 'package:flutter_adaptive_scaffold/flutter_adaptive_scaffold.dart';
import 'package:go_router/go_router.dart';

import 'package:habit_quokka/models/destination.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
    required this.child,
  });

  final List<Destination> _destinations = Destination.values;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    int selectedIndex = _destinations.indexWhere(
      (destination) => destination.path == GoRouter.of(context).location,
    );
    return AdaptiveScaffold(
      useDrawer: false,
      internalAnimations: false,
      selectedIndex: math.max(selectedIndex, 0),
      onSelectedIndexChange: (int index) {
        final destination = _destinations[index];
        GoRouter.of(context).go(destination.path);
      },
      destinations: _destinations
          .map((destination) => destination.model)
          .toList(growable: false),
      body: (_) => child,
    );
  }
}

extension _Model on Destination {
  NavigationDestination get model {
    switch (this) {
      case Destination.home:
        return const NavigationDestination(
          label: 'Home',
          icon: Icon(Icons.home_outlined),
          selectedIcon: Icon(Icons.home_filled),
          tooltip: 'Home page',
        );
      case Destination.trackers:
        return const NavigationDestination(
          label: 'My Trackers',
          icon: Icon(Icons.group_outlined),
          selectedIcon: Icon(Icons.group),
          tooltip: 'My Trackers page',
        );
    }
  }
}
