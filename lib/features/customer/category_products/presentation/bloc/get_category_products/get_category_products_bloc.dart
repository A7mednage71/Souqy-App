import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_store/features/admin/products/data/models/products_response_model.dart';
import 'package:my_store/features/customer/category_products/data/repos/category_products.dart';

part 'get_category_products_bloc.freezed.dart';
part 'get_category_products_event.dart';
part 'get_category_products_state.dart';

class GetCategoryProductsBloc
    extends Bloc<GetCategoryProductsEvent, GetCategoryProductsState> {
  GetCategoryProductsBloc(this.categoriesRepo)
      : super(const GetCategoryProductsState.initial()) {
    on<GetProductsByCategory>(getCategoryProducts);
  }

  final CategoryProductsRepo categoriesRepo;
  FutureOr<void> getCategoryProducts(
    GetProductsByCategory event,
    Emitter<GetCategoryProductsState> emit,
  ) async {
    emit(const GetCategoryProductsState.loading());
    final result = await categoriesRepo.getProductsByCategory(event.categoryId);

    result.when(
      success: (products) =>
          emit(GetCategoryProductsState.success(products.data.products)),
      failure: (error) {
        emit(GetCategoryProductsState.failure(error.errMessages));
      },
    );
  }
}
