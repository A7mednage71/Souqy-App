import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_store/core/app/upload_image/cubit/upload_image_cubit.dart';
import 'package:my_store/core/di/dependency_injection.dart';
import 'package:my_store/features/admin/categories/presentation/bloc/get_categories/get_categories_bloc.dart';
import 'package:my_store/features/admin/products/data/models/products_response_model.dart';
import 'package:my_store/features/admin/products/presentation/bloc/update_product/update_product_bloc.dart';
import 'package:my_store/features/admin/products/presentation/views/widgets/update_product/update_product_bottom_sheet.dart';

class EditProduct extends StatelessWidget {
  const EditProduct({
    super.key,
    this.product,
  });
  final ProductModel? product;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        showEditProductBottomSheet(context, product);
      },
      icon: const Icon(Icons.edit, color: Colors.white),
    );
  }

  void showEditProductBottomSheet(
    BuildContext context,
    ProductModel? product,
  ) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.r),
      ),
      builder: (context) => MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => getIt<UpdateProductBloc>(),
          ),
          BlocProvider(
            create: (context) => getIt<UploadImageCubit>(),
          ),
          BlocProvider(
            create: (context) => getIt<GetCategoriesBloc>()
              ..add(const GetCategoriesEvent.getCategories()),
          ),
        ],
        child: UpdateProductBottomSheet(product: product),
      ),
    );
  }
}
