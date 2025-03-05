part of 'get_first_ten_products_bloc.dart';

@freezed
class GetFirstTenProductsState with _$GetFirstTenProductsState {
  const factory GetFirstTenProductsState.initial() = _Initial;
  const factory GetFirstTenProductsState.loading() = _Loading;
  const factory GetFirstTenProductsState.success(List<ProductModel> products) =
      _Success;
  const factory GetFirstTenProductsState.failure(String message) = _Failure;
}
