import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_store/features/admin/dashboard/data/repos/dashboard_repo.dart';

part 'fetch_number_of_products_bloc.freezed.dart';
part 'fetch_number_of_products_event.dart';
part 'fetch_number_of_products_state.dart';

class FetchNumberOfProductsBloc
    extends Bloc<FetchNumberOfProductsEvent, FetchNumberOfProductsState> {
  FetchNumberOfProductsBloc(this._dashboardRepo)
      : super(const FetchNumberOfProductsState.loading()) {
    on<FetchNumberOfProducts>(_fetchNumberOfProducts);
  }

  final DashboardRepo _dashboardRepo;

  FutureOr<void> _fetchNumberOfProducts(
    FetchNumberOfProducts event,
    Emitter<FetchNumberOfProductsState> emit,
  ) async {
    emit(const FetchNumberOfProductsState.loading());
    final result = await _dashboardRepo.numberOfProducts();
    result.when(
      success: (response) =>
          emit(FetchNumberOfProductsState.success(response.numberOfProducts)),
      failure: (error) =>
          emit(FetchNumberOfProductsState.failure(error.errMessages)),
    );
  }
}
