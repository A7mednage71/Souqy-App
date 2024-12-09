import 'dart:developer';

import 'package:my_store/core/services/shared_pref/shared_pref.dart';
import 'package:my_store/core/services/shared_pref/shared_pref_keys.dart';

class FontFamilyHelper {
  static const String arabicCairo = 'Cairo';
  static const String englihsPoppins = 'Poppins';

  static String getFontFamily() {
    final currentLanguage =
        SharedPrefService.getString(SharedPrefKeys.language);
    if (currentLanguage == 'en') {
      log('english');
      return englihsPoppins;
    } else {
      log('arabic');
      return arabicCairo;
    }
  }
}
