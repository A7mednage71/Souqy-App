import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_store/features/admin/categories/data/models/categories_response_model.dart';
import 'package:my_store/features/customer/customer_home/data/repos/customer_home_repo.dart';

part 'get_customer_categories_bloc.freezed.dart';
part 'get_customer_categories_event.dart';
part 'get_customer_categories_state.dart';

class GetCustomerCategoriesBloc
    extends Bloc<GetCustomerCategoriesEvent, GetCustomerCategoriesState> {
  GetCustomerCategoriesBloc(this.categoriesRepo)
      : super(const GetCustomerCategoriesState.initial()) {
    on<GetCustomerCategories>(getAllCategories);
  }

  final CustomerHomeRepo categoriesRepo;

  FutureOr<void> getAllCategories(
    GetCustomerCategories event,
    Emitter<GetCustomerCategoriesState> emit,
  ) async {
    emit(const GetCustomerCategoriesState.loading());
    final result = await categoriesRepo.getCategories();
    result.when(
      success: (response) =>
          emit(GetCustomerCategoriesState.success(response.data.categories)),
      failure: (error) =>
          emit(GetCustomerCategoriesState.failure(error.errMessages)),
    );
  }
}
