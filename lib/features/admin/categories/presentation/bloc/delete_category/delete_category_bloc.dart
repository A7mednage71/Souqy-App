import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_store/features/admin/categories/data/repos/categories_repo.dart';

part 'delete_category_bloc.freezed.dart';
part 'delete_category_event.dart';
part 'delete_category_state.dart';

class DeleteCategoryBloc
    extends Bloc<DeleteCategoryEvent, DeleteCategoryState> {
  DeleteCategoryBloc(this._categoriesRepo)
      : super(const DeleteCategoryState.initial()) {
    on<DeleteCategory>(deleteCategory);
  }
  final CategoriesRepo _categoriesRepo;

  FutureOr<void> deleteCategory(
    DeleteCategory event,
    Emitter<DeleteCategoryState> emit,
  ) async {
    emit(DeleteCategoryState.loading(id: event.id));
    final result = await _categoriesRepo.deleteCategory(id: event.id);
    result.when(
      success: (response) => emit(const DeleteCategoryState.success()),
      failure: (error) => emit(DeleteCategoryState.failure(error.errMessages)),
    );
  }
}
