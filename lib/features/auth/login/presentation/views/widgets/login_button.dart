import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_store/core/animations/animate_do.dart';
import 'package:my_store/core/common/widgets/custom_linear_button.dart';
import 'package:my_store/core/extensions/localization_context.dart';
import 'package:my_store/core/extensions/navigation_context.dart';
import 'package:my_store/core/extensions/theme_context.dart';
import 'package:my_store/core/languages/localization_keys.dart';
import 'package:my_store/core/routes/routes.dart';
import 'package:my_store/core/style/fonts/font_weight_helper.dart';
import 'package:my_store/features/auth/login/presentation/bloc/login_bloc.dart';
import 'package:my_store/features/auth/widgets/show_toast.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomFadeInRight(
      duration: 600,
      child: BlocConsumer<LoginBloc, LoginState>(
        listener: (context, state) {
          state.whenOrNull(
            failure: (message) {
              ShowToast.showFailureToast(
                context.translate(LocalizationKeys.loggedError),
              );
            },
            success: (userRole) {
              ShowToast.showSuccessToast(
                context.translate(LocalizationKeys.loggedSuccessfully),
              );
              if (userRole == 'admin') {
                context.pushNamedAndRemoveUntil(Routes.homeAdmin);
              } else {
                context.pushNamedAndRemoveUntil(Routes.customerMainScreen);
              }
            },
          );
        },
        builder: (context, state) {
          return state.maybeWhen(
            loading: () {
              return CustomLinearButton(
                width: double.infinity,
                height: 50.h,
                child: const CircularProgressIndicator(
                  color: Colors.white,
                ),
              );
            },
            orElse: () {
              return CustomLinearButton(
                onTap: () {
                  validateLogin(context);
                },
                width: double.infinity,
                height: 50.h,
                child: Text(
                  context.translate(LocalizationKeys.login),
                  style: context.textStyle.copyWith(
                    fontSize: 16.sp,
                    fontWeight: FontWeightHelper.bold,
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }

  void validateLogin(BuildContext context) {
    if (context.read<LoginBloc>().formKey.currentState!.validate()) {
      context.read<LoginBloc>().add(
            const LoginEvent.login(),
          );
    }
  }
}
