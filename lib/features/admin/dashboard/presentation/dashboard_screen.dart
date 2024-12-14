import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_store/core/common/widgets/custom_admin_appbar.dart';
import 'package:my_store/core/style/images/app_images.dart';
import 'package:my_store/features/admin/dashboard/presentation/widgets/dashboard_item.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAdminAppBar(title: 'Dashboard'),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
        child: RefreshIndicator(
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
        ),
      ),
    );
  }
}
