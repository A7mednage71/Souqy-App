import 'package:flutter/material.dart';
import 'package:my_store/core/languages/localization_keys.dart';
import 'package:my_store/core/style/images/app_images.dart';
import 'package:my_store/features/customer/profile/presentation/views/widgets/application_features_item.dart';
import 'package:my_store/features/customer/profile/presentation/views/widgets/change_language_dailog.dart';

class AppLanguage extends StatelessWidget {
  const AppLanguage({super.key});

  @override
  Widget build(BuildContext context) {
    return ApplicationFeaturesItem(
      image: AppImages.imagesSvgLanguage,
      leadingText: LocalizationKeys.languageTilte,
      trailingText: LocalizationKeys.langCode,
      onTap: () {
        showDialog<void>(
          context: context,
          builder: (context) => const ChangeLanguageDailog(),
        );
      },
    );
  }
}
