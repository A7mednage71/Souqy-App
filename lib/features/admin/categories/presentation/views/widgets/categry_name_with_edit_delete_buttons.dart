import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_store/core/extensions/theme_context.dart';
import 'package:my_store/core/style/colors/colors_dark.dart';
import 'package:my_store/core/style/fonts/font_weight_helper.dart';
import 'package:my_store/features/admin/categories/presentation/views/widgets/edit_category/edit_category_bottom_sheet.dart';

class CategoryNameWithDeleteAndEditCategory extends StatelessWidget {
  const CategoryNameWithDeleteAndEditCategory({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'MacBook',
          style: context.textStyle.copyWith(
            color: Colors.white,
            fontSize: 18.sp,
            fontWeight: FontWeightHelper.bold,
          ),
        ),
        Row(
          children: [
            IconButton(
              onPressed: () {
                showEditBottomSheet(context);
              },
              icon: const Icon(
                Icons.edit,
                color: Colors.white,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.delete,
                color: Colors.red,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Future<dynamic> showEditBottomSheet(BuildContext context) {
    return showModalBottomSheet(
      backgroundColor: ColorsDark.blueDark,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.r),
          topRight: Radius.circular(20.r),
        ),
      ),
      context: context,
      builder: (context) {
        return const EditCategoryBottomSheet();
      },
    );
  }
}
