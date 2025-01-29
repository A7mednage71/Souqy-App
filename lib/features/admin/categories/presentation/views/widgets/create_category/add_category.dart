import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_store/core/common/widgets/custom_linear_button.dart';
import 'package:my_store/core/di/dependency_injection.dart';
import 'package:my_store/core/extensions/theme_context.dart';
import 'package:my_store/core/style/colors/colors_dark.dart';
import 'package:my_store/core/style/fonts/font_weight_helper.dart';
import 'package:my_store/features/admin/categories/presentation/bloc/create_category/create_category_bloc.dart';
import 'package:my_store/features/admin/categories/presentation/views/widgets/create_category/create_category_bottom_sheet.dart';

class AddCategory extends StatelessWidget {
  const AddCategory({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'Get All Categories',
          style: context.textStyle.copyWith(
            fontSize: 20.sp,
            fontWeight: FontWeightHelper.medium,
          ),
        ),
        const Spacer(),
        CustomLinearButton(
          width: 100.w,
          height: 40.h,
          child: Text(
            'Add',
            style: context.textStyle.copyWith(
              color: Colors.white,
              fontSize: 16.sp,
              fontWeight: FontWeightHelper.bold,
            ),
          ),
          onTap: () async {
            await showBottomSheet(context);
          },
        ),
      ],
    );
  }

  Future<dynamic> showBottomSheet(BuildContext context) {
    return showModalBottomSheet(
      backgroundColor: ColorsDark.blueDark,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.r),
          topRight: Radius.circular(20.r),
        ),
      ),
      context: context,
      builder: (context) {
        return BlocProvider(
          create: (context) => getIt<CreateCategoryBloc>(),
          child: const CreateCategryBottomSheet(),
        );
      },
    );
  }
}
