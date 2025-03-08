import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_store/core/languages/localization_keys.dart';
import 'package:my_store/features/auth/register/presentation/views/widgets/have_account_button.dart';
import 'package:my_store/features/auth/register/presentation/views/widgets/sighn_up_button.dart';
import 'package:my_store/features/auth/register/presentation/views/widgets/sign_up_form.dart';
import 'package:my_store/features/auth/register/presentation/views/widgets/user_circle_avatar.dart';
import 'package:my_store/features/auth/widgets/auth_bottom_nav_bar.dart';
import 'package:my_store/features/auth/widgets/auth_title_info.dart';
import 'package:my_store/features/auth/widgets/theme_language_toggle.dart';

class SighnUpScreen extends StatelessWidget {
  const SighnUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 20.h,
                ),
                const AppThemeAndLanguageToggle(),
                SizedBox(
                  height: 20.h,
                ),
                const AuthTitleInfo(
                  title: LocalizationKeys.signUp,
                  subtitle: LocalizationKeys.signUpWelcome,
                ),
                SizedBox(
                  height: 20.h,
                ),
                const UserCircleAvatar(),
                SizedBox(
                  height: 10.h,
                ),
                const SignUpForm(),
                SizedBox(
                  height: 10.h,
                ),
                const SighnUpButton(),
                SizedBox(
                  height: 10.h,
                ),
                const HaveAccountButton(),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: const AuthBottomNavBar(),
    );
  }
}
