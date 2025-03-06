import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_store/features/admin/products/data/models/products_response_model.dart';
import 'package:my_store/features/customer/customer_home/data/repos/customer_home_repo.dart';

part 'get_all_products_with_pagination_bloc.freezed.dart';
part 'get_all_products_with_pagination_event.dart';
part 'get_all_products_with_pagination_state.dart';

class GetAllProductsWithPaginationBloc extends Bloc<
    GetAllProductsWithPaginationEvent, GetAllProductsWithPaginationState> {
  GetAllProductsWithPaginationBloc(this._customerHomeRepo)
      : super(
          const GetAllProductsWithPaginationState.initial(),
        ) {
    on<GetProducts>(getProducts);
  }
  final CustomerHomeRepo _customerHomeRepo;

  int offset = 0;
  bool hasNextPage = true;
  bool isFetching = false;
  List<ProductModel> allFetchedProducts = [];

  FutureOr<void> getProducts(
    GetProducts event,
    Emitter<GetAllProductsWithPaginationState> emit,
  ) async {
    if (isFetching || (!hasNextPage && !event.isRefresh)) return;

    if (event.isRefresh) {
      _resetPagination();
      emit(const GetAllProductsWithPaginationState.loading());
    }

    isFetching = true;

    final result =
        await _customerHomeRepo.getProductsWithPagination(offset: offset);

    result.when(
      success: (products) {
        final newProducts = products.data.products;

        if (newProducts.isNotEmpty) {
          allFetchedProducts.addAll(newProducts);
          offset += newProducts.length;
        }
        
        hasNextPage = newProducts.length == 10;

        isFetching = false;

        emit(
          GetAllProductsWithPaginationState.success(
            List.from(allFetchedProducts),
          ),
        );
      },
      failure: (error) {
        isFetching = false;
        emit(GetAllProductsWithPaginationState.failure(error.errMessages));
      },
    );
  }

  void _resetPagination() {
    offset = 0;
    allFetchedProducts.clear();
    hasNextPage = true;
  }
}
