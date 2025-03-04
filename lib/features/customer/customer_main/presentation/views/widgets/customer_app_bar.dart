import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_store/core/animations/animate_do.dart';
import 'package:my_store/core/common/widgets/custom_linear_button.dart';
import 'package:my_store/core/enums/bottom_nav_bar_items.dart';
import 'package:my_store/core/extensions/localization_context.dart';
import 'package:my_store/core/extensions/theme_context.dart';
import 'package:my_store/core/languages/localization_keys.dart';
import 'package:my_store/core/style/images/app_images.dart';
import 'package:my_store/features/customer/customer_main/presentation/cubit/bottom_navigation_cubit.dart';

class CustomerAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomerAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<BottomNavigationCubit>();
    return BlocBuilder<BottomNavigationCubit, BottomNavigationState>(
      builder: (context, state) {
        return cubit.selectedBottomNavBar == BottomNavBarItems.profile
            ? AppBar(
                backgroundColor: context.themeColors.mainColor,
              )
            : AppBar(
                backgroundColor: context.themeColors.mainColor,
                elevation: 0,
                title: CustomFadeInRight(
                  duration: 200,
                  child: Text(
                    context.translate(LocalizationKeys.chooseProducts),
                    style: context.textStyle.copyWith(
                      color: Colors.white,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                actions: [
                  CustomFadeInLeft(
                    duration: 200,
                    child: CustomLinearButton(
                      onTap: () {},
                      width: 40.w,
                      child: SvgPicture.asset(
                        AppImages.imagesSvgSearch,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                ],
              );
      },
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(60.h);
}
