import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_store/features/admin/categories/data/models/categories_response_model.dart';
import 'package:my_store/features/admin/categories/data/repos/categories_repo.dart';

part 'update_category_bloc.freezed.dart';
part 'update_category_event.dart';
part 'update_category_state.dart';

class UpdateCategoryBloc
    extends Bloc<UpdateCategoryEvent, UpdateCategoryState> {
  UpdateCategoryBloc(this._categoriesRepo)
      : super(const UpdateCategoryState.initial()) {
    on<UpdateCategory>(updateCategory);
  }

  final CategoriesRepo _categoriesRepo;
  String updatedImage = '';
  TextEditingController updateCategoryNameController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  FutureOr<void> updateCategory(
    UpdateCategory event,
    Emitter<UpdateCategoryState> emit,
  ) async {
    emit(const UpdateCategoryState.loading());
    final result =
        await _categoriesRepo.updateCategory(categoryModel: event.category);
    result.when(
      success: (response) => emit(const UpdateCategoryState.success()),
      failure: (error) => emit(UpdateCategoryState.failure(error.errMessages)),
    );
  }
}
