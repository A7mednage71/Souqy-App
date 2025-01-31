import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_store/core/app/upload_image/cubit/upload_image_cubit.dart';
import 'package:my_store/core/common/widgets/custom_linear_button.dart';
import 'package:my_store/core/di/dependency_injection.dart';
import 'package:my_store/core/style/fonts/font_weight_helper.dart';
import 'package:my_store/features/admin/categories/presentation/bloc/get_categories/get_categories_bloc.dart';
import 'package:my_store/features/admin/products/presentation/bloc/create_product/create_product_bloc.dart';
import 'package:my_store/features/admin/products/presentation/views/widgets/create_product/create_product_bottom_sheet.dart';

class AddProduct extends StatelessWidget {
  const AddProduct({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomLinearButton(
      width: 100.w,
      height: 40.h,
      child: Text(
        'Add',
        style: TextStyle(
          color: Colors.white,
          fontSize: 16.sp,
          fontWeight: FontWeightHelper.bold,
        ),
      ),
      onTap: () {
        showCreateProductBottomSheet(context);
      },
    );
  }

  void showCreateProductBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.r),
      ),
      builder: (context) => MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => getIt<CreateProductBloc>(),
          ),
          BlocProvider(
            create: (context) => getIt<UploadImageCubit>(),
          ),
          BlocProvider(
            create: (context) => getIt<GetCategoriesBloc>()
              ..add(const GetCategoriesEvent.getCategories()),
          ),
        ],
        child: const CreateProductBottomSheet(),
      ),
    );
  }
}
