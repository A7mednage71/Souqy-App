import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_store/core/app/app_cubit/cubit/app_cubit.dart';
import 'package:my_store/core/common/widgets/custom_dailog.dart';
import 'package:my_store/core/languages/app_localizations.dart';
import 'package:my_store/core/languages/localization_keys.dart';
import 'package:my_store/core/style/images/app_images.dart';
import 'package:my_store/features/customer/profile/presentation/views/widgets/application_features_item.dart';

class AppLanguage extends StatelessWidget {
  const AppLanguage({super.key});

  @override
  Widget build(BuildContext context) {
    final appCubit = context.read<AppCubit>();
    return ApplicationFeaturesItem(
      image: AppImages.imagesSvgLanguage,
      leadingText: LocalizationKeys.languageTilte,
      trailingText: LocalizationKeys.langCode,
      onTap: () {
        showDialog<void>(
          context: context,
          builder: (context) => CustomDialog(
            title: LocalizationKeys.changeToTheLanguage,
            onPressed: () {
              if (AppLocalizations.of(context)!.isEnLocale) {
                appCubit.changeLanguageToArabic();
              } else {
                appCubit.changeLanguageToEnglish();
              }
            },
          ),
        );
      },
    );
  }
}
