import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_store/features/admin/products/data/models/products_response_model.dart';
import 'package:my_store/features/customer/customer_home/data/repos/customer_home_repo.dart';

part 'get_first_ten_products_bloc.freezed.dart';
part 'get_first_ten_products_event.dart';
part 'get_first_ten_products_state.dart';

class GetFirstTenProductsBloc
    extends Bloc<GetFirstTenProductsEvent, GetFirstTenProductsState> {
  GetFirstTenProductsBloc(this._customerHomeRepo)
      : super(const GetFirstTenProductsState.initial()) {
    on<GetFirstTenProductsEvent>(getFirstTenProducts);
  }

  final CustomerHomeRepo _customerHomeRepo;

  FutureOr<void> getFirstTenProducts(
    GetFirstTenProductsEvent event,
    Emitter<GetFirstTenProductsState> emit,
  ) async {
    emit(const GetFirstTenProductsState.loading());
    final result = await _customerHomeRepo.getProductsWithPagination(offset: 0);
    result.when(
      success: (response) {
        emit(GetFirstTenProductsState.success(response.data.products));
      },
      failure: (error) =>
          emit(GetFirstTenProductsState.failure(error.errMessages)),
    );
  }
}
