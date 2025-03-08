import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_store/features/admin/categories/data/models/categories_response_model.dart';
import 'package:my_store/features/admin/categories/presentation/views/widgets/category_item.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CategoriesListViewLoading extends StatelessWidget {
  const CategoriesListViewLoading({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final categories = List.generate(
      5,
      (index) => Category(
        id: '',
        name: 'Loading...',
        image: 'https://i.imgur.com/QkIa5tT.jpeg',
      ),
    );
    return Skeletonizer(
      ignoreContainers: true,
      child: ListView.builder(
        itemCount: categories.length,
        itemBuilder: (context, index) => Padding(
          padding: EdgeInsets.only(top: index == 0 ? 0 : 20.h),
          child: CategoryItem(category: categories[index]),
        ),
      ),
    );
  }
}
