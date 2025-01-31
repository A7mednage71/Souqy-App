import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_store/features/admin/products/data/repos/products_repo.dart';

part 'delete_product_bloc.freezed.dart';
part 'delete_product_event.dart';
part 'delete_product_state.dart';

class DeleteProductBloc extends Bloc<DeleteProductEvent, DeleteProductState> {
  DeleteProductBloc(this._productsRepo)
      : super(const DeleteProductState.initial()) {
    on<DeleteProduct>(deleteProduct);
  }

  final ProductsRepo _productsRepo;

  FutureOr<void> deleteProduct(
    DeleteProduct event,
    Emitter<DeleteProductState> emit,
  ) async {
    emit(DeleteProductState.loadingAtProduct(productId: event.id));
    final result = await _productsRepo.deleteProduct(productId: event.id);
    result.when(
      success: (response) => emit(const DeleteProductState.success()),
      failure: (error) => emit(DeleteProductState.failure(error.errMessages)),
    );
  }
}
