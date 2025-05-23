import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:my_store/core/animations/animate_do.dart';
import 'package:my_store/core/extensions/theme_context.dart';
import 'package:my_store/core/style/images/app_images.dart';
import 'package:my_store/features/customer/customer_main/presentation/views/widgets/bottom_nav_bar_item.dart';

class CustomerBottomNavBar extends StatelessWidget {
  const CustomerBottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomFadeInUp(
      duration: 200,
      child: Container(
        color: context.themeColors.navBarbg,
        child: SizedBox(
          height: 60.h,
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Column(
                children: [
                  SizedBox(height: 10.h),
                  Row(
                    children: [
                      SizedBox(width: 80.w),
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            BottomNavBarItem(
                              icon: AppImages.imagesSvgHomeTabIcon,
                              isSelected: true,
                              onTap: () {},
                            ),
                            BottomNavBarItem(
                              icon: AppImages.imagesSvgCategoriesTapIcon,
                              isSelected: false,
                              onTap: () {},
                            ),
                            BottomNavBarItem(
                              icon: AppImages.imagesSvgFavouriteTabIcon,
                              isSelected: false,
                              onTap: () {},
                            ),
                            BottomNavBarItem(
                              icon: AppImages.imagesSvgProfileTabIcon,
                              isSelected: false,
                              onTap: () {},
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Positioned(
                top: -30.h,
                child: Container(
                  width: 100.w,
                  height: 100.h,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(
                        context.themeAssets.bigNavBar!,
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: -10.h,
                left: 35.w,
                child: SvgPicture.asset(
                  AppImages.imagesSvgCarShop,
                  height: 25.h,
                  width: 25.w,
                  // ignore: deprecated_member_use
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
