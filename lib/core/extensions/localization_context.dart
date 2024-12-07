import 'package:flutter/material.dart';
import 'package:my_store/core/languages/app_localizations.dart';

extension LocalizationContext on BuildContext {
  String translate(String key) => AppLocalizations.of(this)!.translate(key)!;
}
