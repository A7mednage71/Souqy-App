part of 'get_first_ten_products_bloc.dart';

@freezed
class GetFirstTenProductsEvent with _$GetFirstTenProductsEvent {
  const factory GetFirstTenProductsEvent.started() = _Started;
  const factory GetFirstTenProductsEvent.getFirstTenProducts() =
      GetFirstTenProducts;
}
