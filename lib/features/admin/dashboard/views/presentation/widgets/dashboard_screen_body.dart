import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_store/features/admin/dashboard/views/presentation/widgets/categories_dash_item.dart';
import 'package:my_store/features/admin/dashboard/views/presentation/widgets/products_dash_item.dart';
import 'package:my_store/features/admin/dashboard/views/presentation/widgets/users_dash_item.dart';

class DashBoardScreenBody extends StatelessWidget {
  const DashBoardScreenBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {},
      child: ListView(
        children: [
          const ProductsDashboarditem(),
          SizedBox(
            height: 20.h,
          ),
          const CategoriesDashboardItem(),
          SizedBox(
            height: 20.h,
          ),
          const UsersDashboardItem(),
        ],
      ),
    );
  }
}
