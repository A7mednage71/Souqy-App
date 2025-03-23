import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_store/core/enums/bottom_nav_bar_items.dart';
import 'package:my_store/core/style/images/app_images.dart';
import 'package:my_store/features/customer/customer_main/presentation/cubit/bottom_navigation_cubit.dart';
import 'package:my_store/features/customer/customer_main/presentation/views/widgets/bottom_nav_bar_item.dart';

class CustomBottomNavBarItemsBlocBuilder extends StatelessWidget {
  const CustomBottomNavBarItemsBlocBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavigationCubit, BottomNavigationState>(
      builder: (context, state) {
        final navCubit = context.read<BottomNavigationCubit>();
        return Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              BottomNavBarItem(
                icon: AppImages.imagesSvgHomeTabIcon,
                isSelected:
                    navCubit.selectedBottomNavBar == BottomNavBarItems.home,
                onTap: navCubit.navigateToHome,
              ),
              BottomNavBarItem(
                icon: AppImages.imagesSvgIconsNotification,
                isSelected: navCubit.selectedBottomNavBar ==
                    BottomNavBarItems.notifications,
                onTap: navCubit.navigateToNotifications,
              ),
              BottomNavBarItem(
                icon: AppImages.imagesSvgFavouriteTabIcon,
                isSelected: navCubit.selectedBottomNavBar ==
                    BottomNavBarItems.favorites,
                onTap: navCubit.navigateToFavorites,
              ),
              BottomNavBarItem(
                icon: AppImages.imagesSvgProfileTabIcon,
                isSelected:
                    navCubit.selectedBottomNavBar == BottomNavBarItems.profile,
                onTap: navCubit.navigateToProfile,
              ),
            ],
          ),
        );
      },
    );
  }
}
