import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_store/features/admin/products/data/models/products_response_model.dart';
import 'package:my_store/features/admin/products/data/repos/products_repo.dart';

part 'get_products_bloc.freezed.dart';
part 'get_products_event.dart';
part 'get_products_state.dart';

class GetProductsBloc extends Bloc<GetProductsEvent, GetProductsState> {
  GetProductsBloc(this._productsRepo)
      : super(const GetProductsState.initial()) {
    on<GetProducts>(getAllProducts);
  }

  final ProductsRepo _productsRepo;

  FutureOr<void> getAllProducts(
    GetProducts event,
    Emitter<GetProductsState> emit,
  ) async {
    emit(const GetProductsState.loading());
    final result = await _productsRepo.getAllProducts();
    result.when(
      success: (response) =>
          emit(GetProductsState.success(response.data.products)),
      failure: (error) => emit(GetProductsState.failure(error.errMessages)),
    );
  }
}
