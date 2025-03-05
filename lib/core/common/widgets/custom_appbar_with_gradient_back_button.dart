import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_store/core/common/widgets/custom_linear_button.dart';
import 'package:my_store/core/extensions/navigation_context.dart';
import 'package:my_store/core/extensions/theme_context.dart';
import 'package:my_store/core/style/fonts/font_weight_helper.dart';

class CustomAppbarWithGradientBackButton extends StatelessWidget
    implements PreferredSizeWidget {
  const CustomAppbarWithGradientBackButton({super.key, this.title});
  final String? title;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: context.themeColors.mainColor,
      title: Text(
        title ?? '',
        style: context.textStyle.copyWith(
          fontSize: 18.sp,
          fontWeight: FontWeightHelper.bold,
          color: Colors.white,
        ),
      ),
      centerTitle: true,
      leading: Padding(
        padding: EdgeInsets.only(left: 10.w),
        child: CustomLinearButton(
          child: Icon(
            Icons.arrow_back_ios_new_sharp,
            color: context.themeColors.textColor,
          ),
          onTap: () {
            context.pop();
          },
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size(double.infinity, 60.h);
}
