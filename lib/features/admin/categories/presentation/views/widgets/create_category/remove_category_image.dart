import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_store/core/extensions/theme_context.dart';
import 'package:my_store/core/style/fonts/font_weight_helper.dart';
import 'package:my_store/features/admin/categories/presentation/bloc/create_category/create_category_bloc.dart';

class RemoveCategoryImage extends StatelessWidget {
  const RemoveCategoryImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              'Add a photo',
              style: context.textStyle.copyWith(
                fontSize: 16.sp,
                fontWeight: FontWeightHelper.regular,
              ),
            ),
            const Spacer(),
            InkWell(
              onTap: () {
                context.read<CreateCategoryBloc>().categoryImage = '';
              },
              borderRadius: BorderRadius.circular(10.r),
              child: Container(
                height: 30.h,
                width: 100.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.r),
                  color: Colors.red,
                ),
                child: Center(
                  child: Text(
                    'Remove',
                    style: context.textStyle.copyWith(
                      fontSize: 16.sp,
                      fontWeight: FontWeightHelper.regular,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
