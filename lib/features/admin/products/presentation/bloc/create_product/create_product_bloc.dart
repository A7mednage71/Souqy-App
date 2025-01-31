import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_store/features/admin/products/data/models/create_product_request_model.dart';
import 'package:my_store/features/admin/products/data/models/create_product_response_model.dart';
import 'package:my_store/features/admin/products/data/repos/products_repo.dart';

part 'create_product_bloc.freezed.dart';
part 'create_product_event.dart';
part 'create_product_state.dart';

class CreateProductBloc extends Bloc<CreateProductEvent, CreateProductState> {
  CreateProductBloc(this._productsRepo)
      : super(const CreateProductState.initial()) {
    on<CreateProduct>(createProduct);
  }

  final ProductsRepo _productsRepo;

  TextEditingController productTitleController = TextEditingController();
  TextEditingController productPriceController = TextEditingController();
  TextEditingController productDescriptionController = TextEditingController();
  String categoryId = '';
  List<String> images = ['', '', ''];

  final formKey = GlobalKey<FormState>();

  FutureOr<void> createProduct(
    CreateProduct event,
    Emitter<CreateProductState> emit,
  ) async {
    emit(const CreateProductState.loading());
    final result = await _productsRepo.createProduct(
      model: CreateProductRequestModel(
        title: productTitleController.text.trim(),
        description: productDescriptionController.text.trim(),
        price: int.parse(productPriceController.text.trim()),
        categoryId: int.parse(categoryId),
        images: images,
      ),
    );
    result.when(
      success: (response) => emit(
        CreateProductState.success(addProduct: response.data.addProduct),
      ),
      failure: (error) => emit(CreateProductState.failure(error.errMessages)),
    );
  }
}
