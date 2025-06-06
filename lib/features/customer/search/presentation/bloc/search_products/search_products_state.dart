part of 'search_products_bloc.dart';

@freezed
class SearchProductsState with _$SearchProductsState {
  const factory SearchProductsState.initial() = _Initial;
  const factory SearchProductsState.loading() = _Loading;
  const factory SearchProductsState.success(List<ProductModel> products) =
      _Success;
  const factory SearchProductsState.failure(String error) = _Failure;
}
