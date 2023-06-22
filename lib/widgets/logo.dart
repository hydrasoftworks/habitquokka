import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import 'package:habitquokka/router/route.dart';
import 'package:habitquokka/theme/assets.dart';

class Logo extends StatelessWidget {
  const Logo({
    super.key,
    required this.isExtended,
  });

  final bool isExtended;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: isExtended ? 16 : 8,
        top: 16,
        right: isExtended ? 0 : 8,
      ),
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: () => GoRouter.of(context).go(AppRoute.onboarding),
          child: SizedBox.square(
            dimension: isExtended ? 100 : 60,
            child: CircleAvatar(
              backgroundColor:
                  Theme.of(context).colorScheme.brightness == Brightness.light
                      ? Theme.of(context).colorScheme.primaryContainer
                      : Theme.of(context).colorScheme.primary,
              child: SvgPicture.asset(AppAssets.logo),
            ),
          ),
        ),
      ),
    );
  }
}
