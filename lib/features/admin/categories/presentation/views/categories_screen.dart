import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_store/core/common/widgets/custom_admin_appbar.dart';
import 'package:my_store/features/admin/categories/presentation/views/widgets/add_category.dart';
import 'package:my_store/features/admin/categories/presentation/views/widgets/category_item.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAdminAppBar(title: 'Categories'),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 20.h),
        child: Column(
          children: [
            const AddCategory(),
            SizedBox(height: 20.h),
            Expanded(
              child: RefreshIndicator(
                onRefresh: () async {},
                child: ListView.builder(
                  itemCount: 5,
                  itemBuilder: (context, index) => Padding(
                    padding: EdgeInsets.only(top: index == 0 ? 0 : 20.h),
                    child: const CategoryItem(),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
