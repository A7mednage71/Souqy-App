import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:my_store/core/common/screens/empty_data.dart';
import 'package:my_store/core/common/screens/failure_state.dart';
import 'package:my_store/core/extensions/navigation_context.dart';
import 'package:my_store/core/extensions/theme_context.dart';
import 'package:my_store/core/routes/routes.dart';
import 'package:my_store/features/admin/products/data/models/products_response_model.dart';
import 'package:my_store/features/customer/customer_home/presentation/views/widgets/customer_product_item.dart';
import 'package:my_store/features/customer/favorites/presentation/cubit/favorites_cubit.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoritesCubit, FavoritesState>(
      builder: (context, state) {
        return state.when(
          initial: () => const SizedBox.shrink(),
          loading: () {
            return Center(
              child: SpinKitDualRing(
                color: context.themeColors.bluePinkDark!,
                size: 20.r,
              ),
            );
          },
          scucess: (favorites) {
            if (favorites.isEmpty) {
              return const Center(
                child: EmptyData(message: 'No notifications'),
              );
            }
            return RefreshIndicator(
              onRefresh: () async {
                context.read<FavoritesCubit>().getFavoritesProducts();
              },
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 20.h,
                    crossAxisSpacing: 10.w,
                    childAspectRatio: 0.7,
                  ),
                  itemCount: favorites.length,
                  itemBuilder: (context, index) {
                    final model = ProductModel(
                      id: favorites[index].id,
                      title: favorites[index].title,
                      price: int.parse(favorites[index].price),
                      description: '',
                      images: [favorites[index].image],
                      category: ProductCategory(
                        name: favorites[index].categoryName,
                        id: '',
                      ),
                    );
                    return GestureDetector(
                      onTap: () {
                        context.pushNamed(
                          Routes.productDetails,
                          arguments: model.id,
                        );
                      },
                      child: CustomerProductItem(productModel: model),
                    );
                  },
                ),
              ),
            );
          },
          failure: () {
            return const FailureState();
          },
        );
      },
    );
  }
}
