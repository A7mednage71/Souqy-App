part of 'get_product_data_bloc.dart';

@freezed
class GetProductDataEvent with _$GetProductDataEvent {
  const factory GetProductDataEvent.started() = _Started;
  const factory GetProductDataEvent.getProductData({required String id}) =
      GetProductData;
}
