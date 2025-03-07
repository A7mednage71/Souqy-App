import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_store/features/admin/products/data/models/products_response_model.dart';
import 'package:my_store/features/customer/search/data/models/search_request_model.dart';
import 'package:my_store/features/customer/search/data/repos/search_products_repo.dart';

part 'search_products_bloc.freezed.dart';
part 'search_products_event.dart';
part 'search_products_state.dart';

class SearchProductsBloc
    extends Bloc<SearchProductsEvent, SearchProductsState> {
  SearchProductsBloc(this._searchProductsRepo)
      : super(const SearchProductsState.initial()) {
    on<SearchProducts>(searchProducts);
  }

  final SearchProductsRepo _searchProductsRepo;

  TextEditingController productNameController = TextEditingController();
  TextEditingController minPriceController = TextEditingController();
  TextEditingController maxPriceController = TextEditingController();

  GlobalKey<FormState> searchWithNameFormKey = GlobalKey<FormState>();
  GlobalKey<FormState> searchWithPriceFormKey = GlobalKey<FormState>();

  FutureOr<void> searchProducts(
    SearchProducts event,
    Emitter<SearchProductsState> emit,
  ) async {
    emit(const SearchProductsState.loading());
    final result = await _searchProductsRepo.searchProducts(
      SearchRequestModel(
        productName: productNameController.text.isEmpty
            ? null
            : productNameController.text,
        minPrice:
            minPriceController.text.isEmpty ? null : minPriceController.text,
        maxPrice:
            maxPriceController.text.isEmpty ? null : maxPriceController.text,
      ),
    );
    result.when(
      success: (data) {
        emit(SearchProductsState.success(data.data.products));
      },
      failure: (failure) {
        emit(SearchProductsState.failure(failure.errMessages));
      },
    );
  }

  void resetState() {
    emit(const SearchProductsState.initial());
  }
}
