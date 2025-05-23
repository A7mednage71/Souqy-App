part of 'create_product_bloc.dart';

@freezed
class CreateProductState with _$CreateProductState {
  const factory CreateProductState.initial() = _Initial;
  const factory CreateProductState.loading() = _Loading;
  const factory CreateProductState.success({
    required AddProductModel addProduct,
  }) = _Success;
  const factory CreateProductState.failure(String errMessage) = _Failure;
}
