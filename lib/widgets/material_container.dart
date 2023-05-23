import 'package:flutter/material.dart';

// Based on https://github.com/egortabula/material3_layout/
enum SurfaceColor {
  /// The lowest tone color that can be used as a background for a surface.
  surface,

  /// A slightly higher tone color that can be used for low-emphasis surfaces.
  surfaceContainerLowest,

  /// A higher tone color that can be used for medium-emphasis surfaces.
  surfaceContainerLow,

  /// A higher tone color that can be used for high-emphasis surfaces.
  surfaceContainer,

  /// A higher tone color that can be used for elevated surfaces, such as dialogs.
  surfaceContainerHigh,

  /// The highest tone color that can be used as a background for a surface.
  surfaceContainerHighest;

  Color color(BuildContext context) {
    switch (this) {
      case SurfaceColor.surface:
        return Theme.of(context).colorScheme.surface;
      case SurfaceColor.surfaceContainerLowest:
        return Theme.of(context).brightness == Brightness.dark
            ? Colors.black
            : Colors.white;
      case SurfaceColor.surfaceContainerLow:
        return ElevationOverlay.applySurfaceTint(
          Theme.of(context).colorScheme.surface,
          Theme.of(context).colorScheme.surfaceTint,
          1,
        );
      case SurfaceColor.surfaceContainer:
        return ElevationOverlay.applySurfaceTint(
          Theme.of(context).colorScheme.surface,
          Theme.of(context).colorScheme.surfaceTint,
          2,
        );
      case SurfaceColor.surfaceContainerHigh:
        return ElevationOverlay.applySurfaceTint(
          Theme.of(context).colorScheme.surface,
          Theme.of(context).colorScheme.surfaceTint,
          3,
        );
      case SurfaceColor.surfaceContainerHighest:
        return Theme.of(context).colorScheme.surfaceVariant;
    }
  }
}

class MaterialContainer extends StatelessWidget {
  const MaterialContainer(
      {super.key, required this.child, required this.surfaceColor});

  final Widget child;
  final SurfaceColor surfaceColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(24),
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: surfaceColor.color(context),
        borderRadius: const BorderRadius.all(Radius.circular(12)),
      ),
      child: child,
    );
  }
}
