import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_store/core/languages/localization_keys.dart';
import 'package:my_store/features/auth/login/presentation/views/widgets/create_account_button.dart';
import 'package:my_store/features/auth/login/presentation/views/widgets/login_button.dart';
import 'package:my_store/features/auth/login/presentation/views/widgets/login_form.dart';
import 'package:my_store/features/auth/widgets/auth_bottom_nav_bar.dart';
import 'package:my_store/features/auth/widgets/auth_title_info.dart';
import 'package:my_store/features/auth/widgets/theme_language_toggle.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const AppThemeAndLanguageToggle(),
                SizedBox(
                  height: 50.h,
                ),
                const AuthTitleInfo(
                  title: LocalizationKeys.login,
                  subtitle: LocalizationKeys.welcome,
                ),
                SizedBox(
                  height: 40.h,
                ),
                const LoginForm(),
                SizedBox(
                  height: 40.h,
                ),
                const LoginButton(),
                SizedBox(
                  height: 40.h,
                ),
                const CreateAccountButton(),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: const AuthBottomNavBar(),
    );
  }
}
