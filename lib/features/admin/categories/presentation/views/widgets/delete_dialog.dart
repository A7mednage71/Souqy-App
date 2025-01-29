import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_store/core/extensions/theme_context.dart';
import 'package:my_store/core/style/fonts/font_weight_helper.dart';
import 'package:my_store/features/admin/categories/presentation/bloc/delete_category/delete_category_bloc.dart';

Future<dynamic> showDeleteCategoryDialog(
  BuildContext context,
  String id,
  DeleteCategoryBloc deleteCategoryBloc,
) {
  return showDialog(
    context: context,
    builder: (context) => AlertDialog(
      backgroundColor: Colors.grey,
      title: Text(
        'Are you sure you want to delete this category?',
        style: context.textStyle.copyWith(
          fontSize: 16.sp,
          fontWeight: FontWeightHelper.medium,
          color: Colors.black,
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('No'),
        ),
        TextButton(
          onPressed: () {
            deleteCategoryBloc.add(
              DeleteCategoryEvent.deleteCategory(id: id),
            );
            Navigator.pop(context);
          },
          child: const Text(
            'Yes',
            style: TextStyle(color: Colors.red),
          ),
        ),
      ],
    ),
  );
}
