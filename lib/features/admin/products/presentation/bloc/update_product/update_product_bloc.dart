import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_store/features/admin/products/data/models/update_product_request_model.dart';
import 'package:my_store/features/admin/products/data/models/update_product_response_model.dart';
import 'package:my_store/features/admin/products/data/repos/products_repo.dart';

part 'update_product_bloc.freezed.dart';
part 'update_product_event.dart';
part 'update_product_state.dart';

class UpdateProductBloc extends Bloc<UpdateProductEvent, UpdateProductState> {
  UpdateProductBloc(this._productsRepo)
      : super(const UpdateProductState.initial()) {
    on<UpdateProduct>(updateProduct);
  }

  final ProductsRepo _productsRepo;

  TextEditingController updateProductTitleController = TextEditingController();
  TextEditingController updateProductPriceController = TextEditingController();
  TextEditingController updateProductDescriptionController =
      TextEditingController();

  String categoryId = '';
  List<String> updatedImages = ['', '', ''];

  final formKey = GlobalKey<FormState>();

  FutureOr<void> updateProduct(
    UpdateProduct event,
    Emitter<UpdateProductState> emit,
  ) async {
    emit(const UpdateProductState.loading());
    final result = await _productsRepo.updateProduct(
      model: UpdateProductRequestModel(
        id: event.productId,
        title: updateProductTitleController.text.trim(),
        description: updateProductDescriptionController.text.trim(),
        price: int.parse(updateProductPriceController.text.trim()),
        categoryId: int.parse(categoryId),
        images: updatedImages,
      ),
    );
    result.when(
      success: (response) =>
          emit(UpdateProductState.success(response.data.updateProduct)),
      failure: (error) => emit(UpdateProductState.failure(error.errMessages)),
    );
  }
}
