import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_store/core/extensions/theme_context.dart';
import 'package:my_store/core/style/colors/colors_dark.dart';
import 'package:my_store/core/style/fonts/font_weight_helper.dart';
import 'package:my_store/features/admin/categories/data/models/categories_response_model.dart';
import 'package:my_store/features/admin/categories/presentation/views/widgets/delete_category_button.dart';
import 'package:my_store/features/admin/categories/presentation/views/widgets/edit_category/edit_category_bottom_sheet.dart';

class CategoryNameWithDeleteAndEditCategory extends StatelessWidget {
  const CategoryNameWithDeleteAndEditCategory({
    required this.category,
    super.key,
  });
  final Category category;
  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: 3,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            category.name,
            style: context.textStyle.copyWith(
              color: Colors.white,
              fontSize: 18.sp,
              fontWeight: FontWeightHelper.bold,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
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
              DeleteCategoryButton(
                categoryId: category.id,
              ),
            ],
          ),
        ],
      ),
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
