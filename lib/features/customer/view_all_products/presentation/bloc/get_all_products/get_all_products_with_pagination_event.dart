part of 'get_all_products_with_pagination_bloc.dart';

@freezed
class GetAllProductsWithPaginationEvent
    with _$GetAllProductsWithPaginationEvent {
  const factory GetAllProductsWithPaginationEvent.started() = _Started;
  const factory GetAllProductsWithPaginationEvent.getProducts({
    required bool isRefresh,
  }) = GetProducts;
}
