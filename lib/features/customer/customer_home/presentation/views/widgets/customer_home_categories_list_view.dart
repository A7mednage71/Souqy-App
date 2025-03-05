import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_store/features/customer/customer_home/presentation/views/widgets/customer_category_item.dart';

class CustomerHomeCategoriesListView extends StatelessWidget {
  const CustomerHomeCategoriesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 110.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(left: 10.w),
            child: const CustomerCategoryItem(),
          );
        },
      ),
    );
  }
}
