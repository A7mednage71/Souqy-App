import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_store/core/common/widgets/custom_admin_appbar.dart';
import 'package:my_store/features/admin/categories/presentation/views/widgets/add_category.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAdminAppBar(title: 'Categories'),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
        child: const Column(
          children: [
            AddCategory(),
          ],
        ),
      ),
    );
  }
}
