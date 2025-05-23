part of 'get_category_products_bloc.dart';

@freezed
class GetCategoryProductsState with _$GetCategoryProductsState {
  const factory GetCategoryProductsState.initial() = _Initial;
  const factory GetCategoryProductsState.loading() = _Loading;
  const factory GetCategoryProductsState.success(List<ProductModel> products) =
      _Success;
  const factory GetCategoryProductsState.failure(String message) = _Failure;
}
