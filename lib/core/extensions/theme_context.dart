import 'package:flutter/material.dart';
import 'package:my_store/core/style/theme/colors_extension.dart';

extension ThemeEx on BuildContext {
  MyColors get theme => Theme.of(this).extension<MyColors>()!;
}
