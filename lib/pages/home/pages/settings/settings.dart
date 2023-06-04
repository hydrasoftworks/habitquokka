import 'dart:math' as math;

import 'package:flutter/material.dart';

import 'package:package_info_plus/package_info_plus.dart';

import 'package:habitquokka/theme/theme.dart';
import 'package:habitquokka/widgets/panel_container.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const PanelContainer(
            surfaceColor: SurfaceColor.surfaceContainerLow,
            child: SizedBox.expand(),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: _buildVersion(),
          ),
        ],
      ),
    );
  }

  Widget _buildVersion() {
    return FutureBuilder(
      // TODO: Move that to a state
      future: PackageInfo.fromPlatform(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) return const SizedBox.shrink();
        final packageInfo = snapshot.data as PackageInfo;
        final buildNumber = packageInfo.buildNumber;
        final buildShort = buildNumber.substring(
          0,
          math.min(7, buildNumber.length),
        );

        return Padding(
          padding: EdgeInsets.only(
            bottom: 6,
            right: Theme.of(context).appSpacing.medium,
          ),
          child: SelectableText(
            '${packageInfo.version} ($buildShort)',
            style: Theme.of(context).textTheme.bodySmall,
          ),
        );
      },
    );
  }
}