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

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: AdaptiveLayout(
        internalAnimations: false,
        primaryNavigation: SlotLayout(
          config: <Breakpoint, SlotLayoutConfig>{
            Breakpoints.medium: _buildPrimaryNavigation(
              context,
              key: Key('$HomePage-primary-navigation-medium'),
              isExtended: false,
            ),
            Breakpoints.large: _buildPrimaryNavigation(
              context,
              key: Key('$HomePage-primary-navigation-large'),
              isExtended: true,
            ),
          },
        ),
        bottomNavigation: SlotLayout(
          config: <Breakpoint, SlotLayoutConfig>{
            Breakpoints.small: _buildBottomNavigation(
              context,
              key: Key('$HomePage-bottom-navigation-small'),
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

  int _selectedIndex(
    BuildContext context,
    List<HomeDestination> destinations,
  ) {
    final path = GoRouterState.of(context).uri.toString();
    return destinations.lastIndexWhere(
      (destination) {
        // Each destination starts with a /, so we need to handle that case separately.
        if (destination == HomeDestination.onboarding) {
          return path == destination.path;
        }
        return path.startsWith(destination.path) ||
            path.contains('redirect=${destination.path}');
      },
    );
  }

  SlotLayoutConfig _buildPrimaryNavigation(
    BuildContext context, {
    required Key key,
    required bool isExtended,
  }) {
    const destinations = [
      HomeDestination.onboarding,
      HomeDestination.trackers,
      HomeDestination.pricing,
      HomeDestination.community,
      HomeDestination.settings,
      HomeDestination.about,
    ];
    final selectedIndex = math.max(_selectedIndex(context, destinations), 0);

    return SlotLayout.from(
      key: key,
      builder: (context) => AdaptiveScaffold.standardNavigationRail(
        selectedIndex: selectedIndex,
        extended: isExtended,
        padding: EdgeInsets.zero,
        onDestinationSelected: (index) =>
            _onDestinationSelected(context, destinations[index]),
        leading: Logo(isExtended: isExtended),
        destinations: destinations
            .map((destination) => destination.model(context))
            .map(AdaptiveScaffold.toRailDestination)
            .toList(growable: false),
      ),
    );
  }

  SlotLayoutConfig _buildBottomNavigation(
    BuildContext context, {
    required Key key,
  }) {
    const List<HomeDestination> destinations = [
      HomeDestination.onboarding,
      HomeDestination.trackers,
      HomeDestination.settings,
      HomeDestination.more,
    ];
    var selectedIndex = _selectedIndex(context, destinations);
    selectedIndex = selectedIndex == -1
        ? destinations.indexOf(HomeDestination.more)
        : selectedIndex;

    return SlotLayout.from(
      key: key,
      inAnimation: AdaptiveScaffold.bottomToTop,
      outAnimation: AdaptiveScaffold.topToBottom,
      builder: (context) => AdaptiveScaffold.standardBottomNavigationBar(
        currentIndex: selectedIndex,
        onDestinationSelected: (index) =>
            _onDestinationSelected(context, destinations[index]),
        destinations: destinations
            .map((destination) => destination.model(context))
            .toList(growable: false),
      ),
    );
  }

  void _onDestinationSelected(
    BuildContext context,
    HomeDestination destination,
  ) {
    GoRouter.of(context).go(destination.path);
  }
}

extension _Model on HomeDestination {
  NavigationDestination model(BuildContext context) {
    switch (this) {
      case HomeDestination.onboarding:
        return NavigationDestination(
          label: name(L10n.of(context)),
          icon: const Icon(Icons.home_outlined),
          selectedIcon: const Icon(Icons.home_filled),
          tooltip: L10n.of(context).homeDestinationOnboardingTooltip,
        );
      case HomeDestination.trackers:
        return NavigationDestination(
          label: name(L10n.of(context)),
          icon: const Icon(Icons.view_module_outlined),
          selectedIcon: const Icon(Icons.view_module),
          tooltip: L10n.of(context).homeDestinationTrackerTooltip,
        );
      case HomeDestination.pricing:
        return NavigationDestination(
          label: name(L10n.of(context)),
          icon: const Icon(Icons.free_breakfast_outlined),
          selectedIcon: const Icon(Icons.free_breakfast),
          tooltip: L10n.of(context).homeDestinationPricingTooltip,
        );
      case HomeDestination.community:
        return NavigationDestination(
          label: name(L10n.of(context)),
          icon: const Icon(Icons.groups_2_outlined),
          selectedIcon: const Icon(Icons.groups_2),
          tooltip: L10n.of(context).homeDestinationCommunityTooltip,
        );
      case HomeDestination.settings:
        return NavigationDestination(
          label: name(L10n.of(context)),
          icon: const Icon(Icons.settings_outlined),
          selectedIcon: const Icon(Icons.settings),
          tooltip: L10n.of(context).homeDestinationSettingsTooltip,
        );
      case HomeDestination.about:
        return NavigationDestination(
          label: name(L10n.of(context)),
          icon: const Icon(Icons.info_outlined),
          selectedIcon: const Icon(Icons.info),
          tooltip: L10n.of(context).homeDestinationAboutTooltip,
        );
      case HomeDestination.more:
        return NavigationDestination(
          label: name(L10n.of(context)),
          icon: const Icon(Icons.more_vert_outlined),
          selectedIcon: const Icon(Icons.more_vert),
          tooltip: L10n.of(context).homeDestinationMoreTooltip,
        );
    }
  }
}
