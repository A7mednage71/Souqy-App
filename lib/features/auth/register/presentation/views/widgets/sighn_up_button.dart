import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_store/core/animations/animate_do.dart';
import 'package:my_store/core/app/upload_image/cubit/upload_image_cubit.dart';
import 'package:my_store/core/common/widgets/custom_linear_button.dart';
import 'package:my_store/core/extensions/localization_context.dart';
import 'package:my_store/core/extensions/theme_context.dart';
import 'package:my_store/core/languages/localization_keys.dart';
import 'package:my_store/core/style/fonts/font_weight_helper.dart';
import 'package:my_store/features/auth/register/presentation/bloc/sighn_up_bloc.dart';

class SighnUpButton extends StatelessWidget {
  const SighnUpButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomFadeInRight(
      duration: 600,
      child: CustomLinearButton(
        onTap: () {
          final avatar = context.read<UploadImageCubit>().uploadImageUrl;
          context.read<SighnUpBloc>().add(SighnUpEvent.signUp(avatar: avatar));
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
      ),
    );
  }
}
