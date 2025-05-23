part of 'get_all_products_with_pagination_bloc.dart';

@freezed
class GetAllProductsWithPaginationState
    with _$GetAllProductsWithPaginationState {
  const factory GetAllProductsWithPaginationState.initial() = _Initial;
  const factory GetAllProductsWithPaginationState.loading() = _Loading;
  const factory GetAllProductsWithPaginationState.success(
      List<ProductModel> products) = _Success;
  const factory GetAllProductsWithPaginationState.failure(String message) =
      _Failure;
}
