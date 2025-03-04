import 'package:flutter/material.dart';
import 'package:my_store/core/extensions/navigation_context.dart';
import 'package:my_store/core/languages/localization_keys.dart';
import 'package:my_store/core/routes/routes.dart';
import 'package:my_store/core/style/images/app_images.dart';
import 'package:my_store/features/customer/profile/presentation/views/widgets/application_features_item.dart';

class BuildDeveloper extends StatelessWidget {
  const BuildDeveloper({super.key});

  @override
  Widget build(BuildContext context) {
    return ApplicationFeaturesItem(
      image: AppImages.imagesSvgBuildDeveloper,
      leadingText: LocalizationKeys.buildDeveloper,
      trailingText: LocalizationKeys.appName,
      onTap: () {
        context.pushNamed(Routes.buildDeveloperWebView);
      },
    );
  }
}
