import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_store/features/admin/products/data/models/products_response_model.dart';
import 'package:my_store/features/customer/product_details/data/repos/product_details_repo.dart';

part 'get_product_data_bloc.freezed.dart';
part 'get_product_data_event.dart';
part 'get_product_data_state.dart';

class GetProductDataBloc
    extends Bloc<GetProductDataEvent, GetProductDataState> {
  GetProductDataBloc(this._productDetailsRepo)
      : super(const GetProductDataState.initial()) {
    on<GetProductData>(getProductData);
  }

  final ProductDetailsRepo _productDetailsRepo;

  FutureOr<void> getProductData(
    GetProductData event,
    Emitter<GetProductDataState> emit,
  ) async {
    emit(const GetProductDataState.loading());
    final result = await _productDetailsRepo.getProduct(productId: event.id);
    result.when(
      success: (response) =>
          emit(GetProductDataState.sccess(response.data.product)),
      failure: (error) => emit(GetProductDataState.failure(error.errMessages)),
    );
  }
}
