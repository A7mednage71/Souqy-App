import 'package:flutter/cupertino.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:my_store/core/languages/app_localizations.dart';

class AppLocalizationsSetup {
  /// This defines the list of locales (languages) supported by the app
  static const Iterable<Locale> supportedLocales = [
    Locale('en'),
    Locale('ar'),
  ];

  static const Iterable<LocalizationsDelegate<dynamic>> localizationsDelegates =
      [
    AppLocalizations.delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    DefaultCupertinoLocalizations.delegate,
  ];

  /// This callback is used if the app is created with a
  /// specific locale using the [WidgetsApp.new] locale parameter.

  static Locale? localeResolutionCallback(
    Locale? locale,
    Iterable<Locale>? supportedLocales,
  ) {
    // Check if the desired locale is supported
    for (final supportedLocale in supportedLocales!) {
      if (supportedLocale.languageCode == locale!.languageCode &&
          supportedLocale.countryCode == locale.countryCode) {
        return supportedLocale;
      }
    }
    // If the desired locale is not supported, return the first supported locale
    return supportedLocales.first;
  }
}
