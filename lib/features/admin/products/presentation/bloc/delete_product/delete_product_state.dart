part of 'delete_product_bloc.dart';

@freezed
class DeleteProductState with _$DeleteProductState {
  const factory DeleteProductState.initial() = _Initial;
  const factory DeleteProductState.loadingAtProduct({
    required String productId,
  }) = _LoadingAtProduct;
  const factory DeleteProductState.success() = _Success;
  const factory DeleteProductState.failure(String message) = _Failure;
}
