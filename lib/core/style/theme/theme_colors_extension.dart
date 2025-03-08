import 'package:flutter/material.dart';
import 'package:my_store/core/style/colors/colors_dark.dart';
import 'package:my_store/core/style/colors/colors_light.dart';

class MyColors extends ThemeExtension<MyColors> {
  const MyColors({
    required this.mainColor,
    required this.bluePinkDark,
    required this.bluePinkLight,
    required this.textColor,
    required this.textFormBorder,
    required this.navBarbg,
    required this.navBarSelectedTab,
    required this.containerShadow1,
    required this.containerShadow2,
    required this.containerLinear1,
    required this.containerLinear2,
    required this.bottomSheetBackground,
  });

  final Color? mainColor;
  final Color? bluePinkDark;
  final Color? bluePinkLight;
  final Color? textColor;
  final Color? textFormBorder;
  final Color? navBarbg;
  final Color? navBarSelectedTab;
  final Color? containerShadow1;
  final Color? containerShadow2;
  final Color? containerLinear1;
  final Color? containerLinear2;
  final Color? bottomSheetBackground;

  @override
  ThemeExtension<MyColors> copyWith({
    Color? mainColor,
    Color? bluePinkDark,
    Color? bluePinkLight,
    Color? textColor,
    Color? textFormBorder,
    Color? navBarbg,
    Color? navBarSelectedTab,
    Color? containerShadow1,
    Color? containerShadow2,
    Color? containerLinear1,
    Color? bottomSheetBackground,
  }) {
    return MyColors(
      mainColor: mainColor,
      bluePinkDark: bluePinkDark,
      bluePinkLight: bluePinkLight,
      textColor: textColor,
      textFormBorder: textFormBorder,
      navBarbg: navBarbg,
      navBarSelectedTab: navBarSelectedTab,
      containerShadow1: containerShadow1,
      containerShadow2: containerShadow2,
      containerLinear1: containerLinear1,
      containerLinear2: containerLinear2,
      bottomSheetBackground: bottomSheetBackground,
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
      bluePinkDark: bluePinkDark,
      bluePinkLight: bluePinkLight,
      textColor: textColor,
      textFormBorder: textFormBorder,
      navBarbg: navBarbg,
      navBarSelectedTab: navBarSelectedTab,
      containerShadow1: containerShadow1,
      containerShadow2: containerShadow2,
      containerLinear1: containerLinear1,
      containerLinear2: containerLinear2,
      bottomSheetBackground: bottomSheetBackground,
    );
  }

  static const MyColors dark = MyColors(
    mainColor: ColorsDark.mainColor,
    bluePinkDark: ColorsDark.blueDark,
    bluePinkLight: ColorsDark.blueLight,
    textColor: ColorsDark.white,
    textFormBorder: ColorsDark.blueLight,
    navBarbg: ColorsDark.navBarDark,
    navBarSelectedTab: ColorsDark.white,
    containerShadow1: ColorsDark.black1,
    containerShadow2: ColorsDark.black2,
    containerLinear1: ColorsDark.black1,
    containerLinear2: ColorsDark.black2,
    bottomSheetBackground: ColorsDark.blueDark,
  );

  static const MyColors light = MyColors(
    mainColor: ColorsLight.mainColor,
    bluePinkDark: ColorsLight.pinkDark,
    bluePinkLight: ColorsLight.pinkLight,
    textColor: ColorsLight.black,
    textFormBorder: ColorsLight.white1,
    navBarbg: ColorsLight.mainColor,
    navBarSelectedTab: ColorsLight.pinkDark,
    containerShadow1: ColorsLight.white1,
    containerShadow2: ColorsLight.white2,
    containerLinear1: ColorsLight.pinkDark,
    containerLinear2: ColorsLight.pinkLight,
    bottomSheetBackground: ColorsLight.white,
  );
}
