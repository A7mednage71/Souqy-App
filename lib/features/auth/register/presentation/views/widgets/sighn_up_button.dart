import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_store/core/animations/animate_do.dart';
import 'package:my_store/core/app/upload_image/cubit/upload_image_cubit.dart';
import 'package:my_store/core/common/widgets/custom_linear_button.dart';
import 'package:my_store/core/extensions/localization_context.dart';
import 'package:my_store/core/extensions/navigation_context.dart';
import 'package:my_store/core/extensions/theme_context.dart';
import 'package:my_store/core/languages/localization_keys.dart';
import 'package:my_store/core/routes/routes.dart';
import 'package:my_store/core/style/fonts/font_weight_helper.dart';
import 'package:my_store/features/auth/register/presentation/bloc/sighn_up_bloc.dart';
import 'package:my_store/features/auth/widgets/show_toast.dart';

class SighnUpButton extends StatelessWidget {
  const SighnUpButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomFadeInRight(
      duration: 600,
      child: BlocConsumer<SighnUpBloc, SighnUpState>(
        listener: (context, state) {
          state.mapOrNull(
            failure: (message) {
              ShowToast.showFailureToast(
                context.translate(message.message),
              );
            },
            success: (_) {
              ShowToast.showSuccessToast(
                context.translate(LocalizationKeys.signUpSuccess),
              );
              context.pushNamedAndRemoveUntil(Routes.login);
            },
          );
        },
        builder: (context, state) {
          return state.maybeWhen(
            loading: () {
              return CustomLinearButton(
                width: double.infinity,
                height: 50.h,
                child: const Center(
                  child: CircularProgressIndicator(
                    color: Colors.white,
                  ),
                ),
              );
            },
            orElse: () {
              return CustomLinearButton(
                onTap: () {
                  sighnUpvalidate(context);
                },
                width: double.infinity,
                height: 50.h,
                child: Text(
                  context.translate(LocalizationKeys.signUp),
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

  void sighnUpvalidate(BuildContext context) {
    final avatar = context.read<UploadImageCubit>().uploadImageUrl;

    if (context.read<SighnUpBloc>().formKey.currentState!.validate()) {
      if (avatar.isEmpty || avatar == '') {
        ShowToast.showFailureToast(
          context.translate(LocalizationKeys.validPickImage),
        );
        return;
      }
      context.read<SighnUpBloc>().add(SighnUpEvent.signUp(avatar: avatar));
    }
  }
}
