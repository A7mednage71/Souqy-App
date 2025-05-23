import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_store/features/admin/categories/data/models/categories_response_model.dart';
import 'package:my_store/features/customer/customer_home/presentation/views/widgets/customer_category_item.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CustomerHomeCategoryLoading extends StatelessWidget {
  const CustomerHomeCategoryLoading({super.key});

  @override
  Widget build(BuildContext context) {
    final category = Category(
      id: '0',
      name: 'Category',
      image: 'https://picsum.photos/200/300',
    );

    final categories = List<Category>.generate(10, (index) => category);

    return Skeletonizer(
      child: SizedBox(
        height: 110.h,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: categories.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.only(left: 10.w),
              child: CustomerCategoryItem(category: categories[index]),
            );
          },
        ),
      ),
    );
  }
}
