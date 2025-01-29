import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_store/features/admin/categories/data/models/create_category_request_model.dart';
import 'package:my_store/features/admin/categories/data/models/create_category_response_model.dart';
import 'package:my_store/features/admin/categories/data/repos/categories_repo.dart';

part 'create_category_bloc.freezed.dart';
part 'create_category_event.dart';
part 'create_category_state.dart';

class CreateCategoryBloc
    extends Bloc<CreateCategoryEvent, CreateCategoryState> {
  CreateCategoryBloc(this._categoriesRepo)
      : super(const CreateCategoryState.initial()) {
    on<CreateCategory>(createCategory);
  }

  final CategoriesRepo _categoriesRepo;

  TextEditingController categoryNameController = TextEditingController();
  String categoryImage = '';
  final formKey = GlobalKey<FormState>();

  FutureOr<void> createCategory(
    CreateCategory event,
    Emitter<CreateCategoryState> emit,
  ) async {
    emit(const CreateCategoryState.loading());
    final result = await _categoriesRepo.createCategory(
      createCategoryModel: CreateCategoryRequestModel(
        name: categoryNameController.text,
        image: categoryImage,
      ),
    );
    result.when(
      success: (response) => emit(CreateCategoryState.success(response)),
      failure: (error) => emit(CreateCategoryState.failure(error.errMessages)),
    );
  }
}
