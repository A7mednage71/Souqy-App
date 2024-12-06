import 'package:flutter/material.dart';
import 'package:my_store/core/style/colors/colors_dark.dart';
import 'package:my_store/core/style/colors/colors_light.dart';

class MyColors extends ThemeExtension<MyColors> {
  const MyColors({
    required this.mainColor,
  });

  final Color? mainColor;

  @override
  ThemeExtension<MyColors> copyWith({
    Color? mainColor,
  }) {
    return MyColors(
      mainColor: mainColor,
    );
  }

  //  Provides smooth transitions between two instances of MyColors.
  //  The lerp (linear interpolation) is used
  //  during animations like theme changes

  @override
  ThemeExtension<MyColors> lerp(
    covariant ThemeExtension<MyColors>? other,
    double t,
  ) {
    if (other is! MyColors) {
      return this;
    }

    return MyColors(
      mainColor: mainColor,
    );
  }

  static const MyColors light = MyColors(
    mainColor: ColorsLight.mainColor,
  );

  static const MyColors dark = MyColors(
    mainColor: ColorsDark.mainColor,
  );
}
