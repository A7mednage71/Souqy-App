import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_store/features/admin/categories/data/models/categories_response_model.dart';
import 'package:my_store/features/admin/categories/data/repos/categories_repo.dart';

part 'get_categories_bloc.freezed.dart';
part 'get_categories_event.dart';
part 'get_categories_state.dart';

class GetCategoriesBloc extends Bloc<GetCategoriesEvent, GetCategoriesState> {
  GetCategoriesBloc(this.categoriesRepo)
      : super(const GetCategoriesState.initial()) {
    on<GetCategories>(getAllCategories);
  }

  final CategoriesRepo categoriesRepo;

  FutureOr<void> getAllCategories(
    GetCategories event,
    Emitter<GetCategoriesState> emit,
  ) async {
    emit(const GetCategoriesState.loading());
    final result = await categoriesRepo.getCategories();
    result.when(
      success: (response) =>
          emit(GetCategoriesState.success(response.data.categories)),
      failure: (error) => emit(GetCategoriesState.failure(error.errMessages)),
    );
  }
}
