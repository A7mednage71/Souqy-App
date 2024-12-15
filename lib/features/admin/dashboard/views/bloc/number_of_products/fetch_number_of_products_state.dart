part of 'fetch_number_of_products_bloc.dart';

@freezed
class FetchNumberOfProductsState with _$FetchNumberOfProductsState {
  const factory FetchNumberOfProductsState.loading() = _Loading;
  const factory FetchNumberOfProductsState.success(String count) = _Success;
  const factory FetchNumberOfProductsState.failure(String message) = _Failure;
}
