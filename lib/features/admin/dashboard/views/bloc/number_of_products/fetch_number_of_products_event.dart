part of 'fetch_number_of_products_bloc.dart';

@freezed
class FetchNumberOfProductsEvent with _$FetchNumberOfProductsEvent {
  const factory FetchNumberOfProductsEvent.started() = _Started;
  const factory FetchNumberOfProductsEvent.fetchNumberOfProducts() =
      FetchNumberOfProducts;
}
