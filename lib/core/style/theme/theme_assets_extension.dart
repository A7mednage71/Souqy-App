import 'package:flutter/material.dart';
import 'package:my_store/core/style/images/app_images.dart';

class MyAssets extends ThemeExtension<MyAssets> {
  const MyAssets({
    required this.bigNavBar,
    required this.homeBg,
  });

  final String? bigNavBar;
  final String? homeBg;

  @override
  ThemeExtension<MyAssets> copyWith({
    String? bigNavBar,
    String? homeBg,
  }) {
    return MyAssets(
      bigNavBar: bigNavBar,
      homeBg: homeBg,
    );
  }

  //  Provides smooth transitions between two instances of my assets.
  //  The lerp (linear interpolation) is used
  //  during animations like theme changes

  @override
  ThemeExtension<MyAssets> lerp(
    covariant ThemeExtension<MyAssets>? other,
    double t,
  ) {
    if (other is! MyAssets) {
      return this;
    }

    return MyAssets(
      bigNavBar: bigNavBar,
      homeBg: homeBg,
    );
  }

  static const MyAssets light = MyAssets(
    bigNavBar: AppImages.imagesCustomerBigNavBarLight,
    homeBg: AppImages.imagesCustomerHomeBgLight,
  );

  static const MyAssets dark = MyAssets(
    bigNavBar: AppImages.imagesCustomerBigNavBarDark,
    homeBg: AppImages.imagesCustomerHomeBgDark,
  );
}
