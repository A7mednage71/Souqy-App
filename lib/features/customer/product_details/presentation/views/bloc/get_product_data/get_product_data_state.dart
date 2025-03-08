part of 'get_product_data_bloc.dart';

@freezed
class GetProductDataState with _$GetProductDataState {
  const factory GetProductDataState.initial() = _Initial;
  const factory GetProductDataState.loading() = _Loading;
  const factory GetProductDataState.sccess(ProductModel product) = _Sccess;
  const factory GetProductDataState.failure(String error) = _Failure;
}
