import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_store/core/common/widgets/custom_container_with_gradient.dart';
import 'package:my_store/core/common/widgets/show_cached_image.dart';
import 'package:my_store/features/admin/categories/data/models/categories_response_model.dart';
import 'package:my_store/features/admin/categories/presentation/views/widgets/categry_name_with_edit_delete_buttons.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({required this.category, super.key});
  final Category category;
  @override
  Widget build(BuildContext context) {
    return CustomContainerWithGradient(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 20.h),
        child: Row(
          children: [
            CategoryNameWithDeleteAndEditCategory(category: category),
            const Spacer(),
            ShowCachedNetworkImage(image: category.image),
          ],
        ),
      ),
    );
  }
}
