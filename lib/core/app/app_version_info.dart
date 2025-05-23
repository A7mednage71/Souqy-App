import 'package:flutter/material.dart';
import 'package:my_store/core/languages/app_localizations.dart';
import 'package:package_info_plus/package_info_plus.dart';

class AppVersionInfo {
  static Future<String> getAppVersion(BuildContext context) async {
    final packageInfo = await PackageInfo.fromPlatform();

    if (context.mounted && AppLocalizations.of(context)!.isEnLocale) {
      return '${packageInfo.version} (${packageInfo.buildNumber})';
    } else {
      return '(${packageInfo.buildNumber}) ${packageInfo.version}';
    }
  }
}
