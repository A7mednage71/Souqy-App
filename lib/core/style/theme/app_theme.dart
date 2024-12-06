import 'package:flutter/material.dart';
import 'package:my_store/core/style/theme/colors_extension.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    extensions: const <ThemeExtension<dynamic>>[MyColors.light],
    useMaterial3: true,
  );

  static ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: Colors.black,
    extensions: const <ThemeExtension<dynamic>>[MyColors.dark],
    useMaterial3: true,
  );
}
