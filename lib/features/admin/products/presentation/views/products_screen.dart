import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_store/core/common/widgets/custom_admin_appbar.dart';
import 'package:my_store/core/di/dependency_injection.dart';
import 'package:my_store/core/extensions/theme_context.dart';
import 'package:my_store/core/style/fonts/font_weight_helper.dart';
import 'package:my_store/features/admin/products/presentation/bloc/delete_product/delete_product_bloc.dart';
import 'package:my_store/features/admin/products/presentation/bloc/get_products/get_products_bloc.dart';
import 'package:my_store/features/admin/products/presentation/views/widgets/create_product/add_product.dart';
import 'package:my_store/features/admin/products/presentation/views/widgets/products_grid_view.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt<GetProductsBloc>()
            ..add(const GetProductsEvent.getProducts()),
        ),
        BlocProvider(
          create: (context) => getIt<DeleteProductBloc>(),
        ),
      ],
      child: Scaffold(
        appBar: const CustomAdminAppBar(title: 'Products'),
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(
                context.themeAssets.homeBg!,
              ),
            ),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 20.h),
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      'Get All Products',
                      style: context.textStyle.copyWith(
                        fontSize: 18.sp,
                        fontWeight: FontWeightHelper.bold,
                      ),
                    ),
                    const Spacer(),
                    const AddProduct(),
                  ],
                ),
                SizedBox(height: 20.h),
                // const ProductItem(),
                const ProductsGridView(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
