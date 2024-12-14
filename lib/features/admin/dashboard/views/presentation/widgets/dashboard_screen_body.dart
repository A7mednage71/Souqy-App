import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_store/core/style/images/app_images.dart';
import 'package:my_store/features/admin/dashboard/views/presentation/widgets/dashboard_item.dart';

class DashBoardScreenBody extends StatelessWidget {
  const DashBoardScreenBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {},
      child: Column(
        children: [
          const DashboardItem(
            title: 'Products',
            count: '50',
            image: AppImages.imagesAdminProductsDrawer,
          ),
          SizedBox(
            height: 20.h,
          ),
          const DashboardItem(
            title: 'Categories',
            count: '50',
            image: AppImages.imagesAdminCategoriesDrawer,
          ),
          SizedBox(
            height: 20.h,
          ),
          const DashboardItem(
            title: 'Users',
            count: '50',
            image: AppImages.imagesAdminUsersDrawer,
          ),
        ],
      ),
    );
  }
}
