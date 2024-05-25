import 'package:flutter/material.dart';

import 'package:flutter_adaptive_scaffold/flutter_adaptive_scaffold.dart';

import 'package:habitquokka/theme/spacing.dart';

// Source: https://github.com/egortabula/material3_layout/

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
        return Theme.of(context).colorScheme.surfaceContainerHighest;
    }
  }
}

/// The [Panel] is a wrapper widget for widgets. The container allows you to select the surface background color, container
/// dimensions, and border radius.
/// Example of usage:
///
/// ```dart
/// Panel(
///   child: YourWidget(),
///   surfaceColor: SurfaceColor.primaryVariant,
///   padding: EdgeInsets.all(16),
/// )
/// ```
class Panel extends StatelessWidget {
  const Panel({
    super.key,
    required this.child,
    this.surfaceColor = SurfaceColor.surfaceContainerLow,
    this.customColor,
    this.padding = defaultPadding,
    this.margin = defaultMargin,
    this.height = double.infinity,
    this.width = double.infinity,
    this.topBorderRadius = 12,
    this.bottomBorderRadius = 12,
  });

  static const EdgeInsets defaultPadding =
      EdgeInsets.all(AppSpacing.initialMedium);
  static const EdgeInsets defaultMargin =
      EdgeInsets.all(AppSpacing.initialSmall);

  static EdgeInsets leftPadding({
    required bool isSplitPage,
  }) =>
      defaultPadding.copyWith(
        left: isSplitPage ? Panel.defaultPadding.left / 2 : null,
      );

  static EdgeInsets rightPadding({
    required bool isSplitPage,
  }) =>
      defaultPadding.copyWith(
        right: isSplitPage ? Panel.defaultPadding.right / 2 : null,
      );

  /// The child widget to be wrapped with the container.
  final Widget child;

  /// The color of the surface of the container. Defaults to [SurfaceColor.surface].
  final SurfaceColor surfaceColor;

  /// The override of color of the surface of the container. Defaults to [surfaceColor].
  final Color? customColor;

  /// The padding for the container's child widget. Defaults to [defaultPadding].
  final EdgeInsetsGeometry padding;

  /// The margin for the container's child widget. Defaults to [defaultMargin].
  final EdgeInsetsGeometry margin;

  /// The width of the container. Defaults to [double.infinity].
  final double width;

  /// The height of the container. Defaults to [double.infinity].
  final double height;

  /// The top border radius for the container. Defaults to 12.
  final double topBorderRadius;

  /// The bottom border radius for the container. Defaults to 12.
  final double bottomBorderRadius;

  @override
  Widget build(BuildContext context) {
    if (Breakpoints.small.isActive(context)) {
      return Container(
        padding: margin,
        color: customColor ?? surfaceColor.color(context),
        child: child,
      );
    }

    return Padding(
      padding: padding,
      child: Material(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(topBorderRadius),
          bottom: Radius.circular(bottomBorderRadius),
        ),
        color: customColor ?? surfaceColor.color(context),
        child: Padding(
          padding: margin,
          child: SizedBox(
            width: width,
            height: height,
            child: child,
          ),
        ),
      ),
    );
  }
}
