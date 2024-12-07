import 'package:flutter/material.dart';
import 'package:my_store/core/style/theme/theme_assets_extension.dart';
import 'package:my_store/core/style/theme/theme_colors_extension.dart';

extension ThemeEx on BuildContext {
  // get the theme colors by context
  MyColors get themeColors => Theme.of(this).extension<MyColors>()!;
  // get the theme assets by context
  MyAssets get themeAssets => Theme.of(this).extension<MyAssets>()!;
}
