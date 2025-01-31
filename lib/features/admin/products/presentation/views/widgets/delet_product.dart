import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:my_store/features/admin/products/presentation/bloc/delete_product/delete_product_bloc.dart';
import 'package:my_store/features/admin/products/presentation/bloc/get_products/get_products_bloc.dart';
import 'package:my_store/features/auth/widgets/show_toast.dart';

class DeleteProduct extends StatelessWidget {
  const DeleteProduct({
    required this.productId,
    super.key,
  });

  final String productId;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DeleteProductBloc, DeleteProductState>(
      listener: (context, state) {
        state.whenOrNull(
          failure: (message) {
            ShowToast.showFailureToast(
              message,
            );
          },
          success: () {
            context
                .read<GetProductsBloc>()
                .add(const GetProductsEvent.getProducts());
            ShowToast.showSuccessToast(
              'Product deleted successfully',
            );
          },
        );
      },
      builder: (context, state) {
        return state.maybeWhen(
          loadingAtProduct: (id) {
            if (id == productId) {
              return const IconButton(
                onPressed: null,
                icon: Center(
                  child: SpinKitDualRing(
                    color: Colors.white,
                    size: 20,
                  ),
                ),
              );
            }
            return const IconButton(
              onPressed: null,
              icon: Icon(Icons.delete, color: Colors.red),
            );
          },
          orElse: () {
            return IconButton(
              onPressed: () {
                context.read<DeleteProductBloc>().add(
                      DeleteProductEvent.deleteProduct(id: productId),
                    );
              },
              icon: const Icon(Icons.delete, color: Colors.red),
            );
          },
        );
      },
    );
  }
}
