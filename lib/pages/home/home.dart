import 'dart:math' as math;

import 'package:flutter/material.dart';

import 'package:flutter_adaptive_scaffold/flutter_adaptive_scaffold.dart';
import 'package:go_router/go_router.dart';

import 'package:habitquokka/l10n/l10n.dart';
import 'package:habitquokka/pages/home/models/home_destination.dart';
import 'package:habitquokka/widgets/logo.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
    required this.child,
  });

  final List<HomeDestination> _destinations = HomeDestination.values;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final selectedIndex = _selectedIndex(context);

    return Scaffold(
      body: AdaptiveLayout(
        internalAnimations: false,
        primaryNavigation: SlotLayout(
          config: <Breakpoint, SlotLayoutConfig>{
            Breakpoints.medium: _buildPrimaryNavigation(
              context,
              key: Key('$HomePage-primary-navigation-medium'),
              selectedIndex: selectedIndex,
              isExtended: false,
            ),
            Breakpoints.large: _buildPrimaryNavigation(
              context,
              key: Key('$HomePage-primary-navigation-large'),
              selectedIndex: selectedIndex,
              isExtended: true,
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
      ),
    );
  }

  int _selectedIndex(BuildContext context) {
    final path = GoRouterState.of(context).location;
    final selectedIndex = _destinations.lastIndexWhere(
      (destination) =>
          path.startsWith(destination.path) ||
          path.contains('redirect=${destination.path}'),
    );
    return math.max(selectedIndex, 0);
  }

  SlotLayoutConfig _buildPrimaryNavigation(
    BuildContext context, {
    required Key key,
    required int selectedIndex,
    required bool isExtended,
  }) {
    return SlotLayout.from(
      key: key,
      builder: (context) => AdaptiveScaffold.standardNavigationRail(
        selectedIndex: selectedIndex,
        extended: isExtended,
        padding: EdgeInsets.zero,
        onDestinationSelected: (index) => onDestinationSelected(context, index),
        leading: Logo(isExtended: isExtended),
        destinations: _destinations
            .map((destination) => destination.model(context))
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
      builder: (context) => AdaptiveScaffold.standardBottomNavigationBar(
        currentIndex: selectedIndex,
        onDestinationSelected: (index) => onDestinationSelected(context, index),
        destinations: _destinations
            .map((destination) => destination.model(context))
            .toList(growable: false),
      ),
    );
  }

  void onDestinationSelected(BuildContext context, int index) {
    final destination = _destinations[index];
    GoRouter.of(context).go(destination.path);
  }
}

extension _Model on HomeDestination {
  NavigationDestination model(BuildContext context) {
    switch (this) {
      case HomeDestination.onboarding:
        return NavigationDestination(
          label: L10n.of(context).homeDestinationOnboardingLabel,
          icon: const Icon(Icons.home_outlined),
          selectedIcon: const Icon(Icons.home_filled),
          tooltip: L10n.of(context).homeDestinationOnboardingTooltip,
        );
      case HomeDestination.trackers:
        return NavigationDestination(
          label: L10n.of(context).homeDestinationTrackerLabel,
          icon: const Icon(Icons.view_module_outlined),
          selectedIcon: const Icon(Icons.view_module),
          tooltip: L10n.of(context).homeDestinationTrackerTooltip,
        );
      case HomeDestination.pricing:
        return NavigationDestination(
          label: L10n.of(context).homeDestinationPricingLabel,
          icon: const Icon(Icons.free_breakfast_outlined),
          selectedIcon: const Icon(Icons.free_breakfast),
          tooltip: L10n.of(context).homeDestinationPricingTooltip,
        );
      case HomeDestination.community:
        return NavigationDestination(
          label: L10n.of(context).homeDestinationCommunityLabel,
          icon: const Icon(Icons.groups_2_outlined),
          selectedIcon: const Icon(Icons.groups_2),
          tooltip: L10n.of(context).homeDestinationCommunityTooltip,
        );
      case HomeDestination.settings:
        return NavigationDestination(
          label: L10n.of(context).homeDestinationSettingsLabel,
          icon: const Icon(Icons.settings_outlined),
          selectedIcon: const Icon(Icons.settings),
          tooltip: L10n.of(context).homeDestinationSettingsTooltip,
        );
      case HomeDestination.about:
        return NavigationDestination(
          label: L10n.of(context).homeDestinationAboutLabel,
          icon: const Icon(Icons.info_outlined),
          selectedIcon: const Icon(Icons.info),
          tooltip: L10n.of(context).homeDestinationAboutTooltip,
        );
    }
  }
}
