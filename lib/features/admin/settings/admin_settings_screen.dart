import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_store/core/common/widgets/custom_admin_appbar.dart';
import 'package:my_store/core/extensions/theme_context.dart';
import 'package:my_store/features/customer/profile/presentation/views/widgets/app_language.dart';
import 'package:my_store/features/customer/profile/presentation/views/widgets/dark_and_light_mode.dart';
import 'package:my_store/features/customer/profile/presentation/views/widgets/logout.dart';

class AdminSettingScreen extends StatelessWidget {
  const AdminSettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAdminAppBar(title: 'Settings'),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(
              context.themeAssets.homeBg!,
            ),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
          child: Column(
            children: [
              SizedBox(height: 40.h),
              const AppLanguage(),
              SizedBox(height: 20.h),
              const DarkAndLightMode(),
              SizedBox(height: 25.h),
              const Logout(),
            ],
          ),
        ),
      ),
    );
  }
}
