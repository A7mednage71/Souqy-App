part of 'get_customer_categories_bloc.dart';

@freezed
class GetCustomerCategoriesEvent with _$GetCustomerCategoriesEvent {
  const factory GetCustomerCategoriesEvent.started() = _Started;
  const factory GetCustomerCategoriesEvent.getCategories() =
      GetCustomerCategories;
}
