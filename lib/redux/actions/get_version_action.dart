import 'dart:math' as math;

import 'package:package_info_plus/package_info_plus.dart';

import 'package:habitquokka/redux/redux.dart';

class GetVersionAction extends Action {
  @override
  Future<AppState?> reduce() async {
    final packageInfo = await PackageInfo.fromPlatform();
    final buildNumber = packageInfo.buildNumber;
    final buildShort = buildNumber.substring(
      0,
      math.min(7, buildNumber.length),
    );

    return state.copyWith(
      version: '${packageInfo.version} ($buildShort)',
    );
  }
}
