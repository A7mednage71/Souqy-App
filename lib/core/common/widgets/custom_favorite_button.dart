import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_store/core/extensions/theme_context.dart';
import 'package:my_store/features/admin/products/data/models/products_response_model.dart';
import 'package:my_store/features/customer/favorites/data/models/favorites_model.dart';
import 'package:my_store/features/customer/favorites/presentation/cubit/favorites_cubit.dart';

class CustomFavoriteButton extends StatelessWidget {
  const CustomFavoriteButton({
    required this.size,
    required this.product,
    super.key,
  });
  final double size;
  final ProductModel product;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoritesCubit, FavoritesState>(
      builder: (context, state) {
        final isFavorite =
            context.read<FavoritesCubit>().isFavorite(productId: product.id!);
        return IconButton(
          padding: EdgeInsets.zero,
          onPressed: () {
            context.read<FavoritesCubit>().toggleFavorites(
                  favoritesModel: FavoritesModel(
                    id: product.id!,
                    title: product.title!,
                    price: product.price.toString(),
                    image: product.images!.first,
                    categoryName: product.category!.name!,
                  ),
                );
          },
          icon: Icon(
            isFavorite ? Icons.favorite : Icons.favorite_outline,
            color: isFavorite
                ? context.themeColors.bluePinkLight
                : context.themeColors.textColor,
            size: size,
          ),
        );
      },
    );
  }
}
