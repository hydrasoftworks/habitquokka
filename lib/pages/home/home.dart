import 'dart:math' as math;

import 'package:flutter/material.dart';

import 'package:adaptive_theme/adaptive_theme.dart';
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
    final selectedIndex = _selectedIndex(context);

    return AdaptiveLayout(
      internalAnimations: false,
      primaryNavigation: SlotLayout(
        config: <Breakpoint, SlotLayoutConfig>{
          Breakpoints.medium: _buildPrimaryNavigation(
            context,
            key: Key('$HomePage-primary-navigation-medium'),
            selectedIndex: selectedIndex,
            extended: false,
          ),
          Breakpoints.large: _buildPrimaryNavigation(
            context,
            key: Key('$HomePage-primary-navigation-large'),
            selectedIndex: selectedIndex,
            extended: true,
          ),
        },
      ),
      bottomNavigation: SlotLayout(
        config: <Breakpoint, SlotLayoutConfig>{
          Breakpoints.small: _buildBottomNavigation(
            context,
            key: Key('$HomePage-bottom-navigation-small'),
            selectedIndex: selectedIndex,
          ),
        },
      ),
      body: SlotLayout(
        config: <Breakpoint, SlotLayoutConfig>{
          Breakpoints.smallAndUp: SlotLayout.from(
            key: Key('$HomePage-body'),
            builder: (_) => child,
          ),
        },
      ),
    );
  }

  int _selectedIndex(BuildContext context) {
    int selectedIndex = _destinations.lastIndexWhere(
      (destination) =>
          GoRouter.of(context).location.startsWith(destination.path),
    );
    return math.max(selectedIndex, 0);
  }

  SlotLayoutConfig _buildPrimaryNavigation(
    BuildContext context, {
    required Key key,
    required int selectedIndex,
    required bool extended,
  }) {
    return SlotLayout.from(
      key: key,
      builder: (_) => AdaptiveScaffold.standardNavigationRail(
        selectedIndex: selectedIndex,
        extended: extended,
        padding: EdgeInsets.zero,
        onDestinationSelected: (index) => onDestinationSelected(context, index),
        destinations: _destinations
            .map((destination) => destination.model)
            .map(AdaptiveScaffold.toRailDestination)
            .toList(growable: false),
      ),
    );
  }

  SlotLayoutConfig _buildBottomNavigation(
    BuildContext context, {
    required Key key,
    required int selectedIndex,
  }) {
    return SlotLayout.from(
      key: key,
      inAnimation: AdaptiveScaffold.bottomToTop,
      outAnimation: AdaptiveScaffold.topToBottom,
      builder: (_) => AdaptiveScaffold.standardBottomNavigationBar(
        currentIndex: selectedIndex,
        onDestinationSelected: (index) => onDestinationSelected(context, index),
        destinations: _destinations
            .map((destination) => destination.model)
            .toList(growable: false),
      ),
    );
  }

  void onDestinationSelected(BuildContext context, int index) {
    final destination = _destinations[index];
    if (destination != Destination.trackers) {
      AdaptiveTheme.of(context).reset();
    }
    GoRouter.of(context).go(destination.path);
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
