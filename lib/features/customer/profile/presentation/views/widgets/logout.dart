import 'package:flutter/material.dart';
import 'package:my_store/core/common/widgets/custom_dailog.dart';
import 'package:my_store/core/extensions/navigation_context.dart';
import 'package:my_store/core/languages/localization_keys.dart';
import 'package:my_store/core/routes/routes.dart';
import 'package:my_store/core/services/secure_storage/secure_storage.dart';
import 'package:my_store/core/services/shared_pref/shared_pref.dart';
import 'package:my_store/core/style/images/app_images.dart';
import 'package:my_store/features/customer/profile/presentation/views/widgets/application_features_item.dart';

class Logout extends StatelessWidget {
  const Logout({super.key});

  @override
  Widget build(BuildContext context) {
    return ApplicationFeaturesItem(
      image: AppImages.imagesSvgLogout,
      leadingText: LocalizationKeys.logOut,
      trailingText: LocalizationKeys.logOut,
      onTap: () {
        showDialog<void>(
          context: context,
          builder: (context) => CustomDialog(
            title: LocalizationKeys.logOutFromApp,
            onPressed: () {
              SecureStorage.clearAllData();
              SharedPrefService.clearAllData();
              context
                ..pop()
                ..pushReplacementNamed(Routes.login);
            },
          ),
        );
      },
    );
  }
}
