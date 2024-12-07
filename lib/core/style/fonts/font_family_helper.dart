class FontFamilyHelper {
  static const String arabicCairo = 'Cairo';
  static const String englihsPoppins = 'Poppins';

  static String getFontFamily() {
    const currentLanguage = 'en';
    if (currentLanguage == 'en') {
      return englihsPoppins;
    } else {
      return arabicCairo;
    }
  }
}
