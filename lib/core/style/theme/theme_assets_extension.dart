import 'package:flutter/material.dart';
import 'package:my_store/core/style/images/app_images.dart';

class MyAssets extends ThemeExtension<MyAssets> {
  const MyAssets({
    required this.testImage,
  });

  final String? testImage;

  @override
  ThemeExtension<MyAssets> copyWith({
    String? testImage,
  }) {
    return MyAssets(
      testImage: testImage,
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
      testImage: testImage,
    );
  }

  static const MyAssets light = MyAssets(
    testImage: AppImages.imagesCoreAppLightSplash,
  );

  static const MyAssets dark = MyAssets(
    testImage: AppImages.imagesCoreAppDarkSplash,
  );
}
