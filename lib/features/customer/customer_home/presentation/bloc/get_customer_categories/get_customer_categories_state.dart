part of 'get_customer_categories_bloc.dart';

@freezed
class GetCustomerCategoriesState with _$GetCustomerCategoriesState {
  const factory GetCustomerCategoriesState.initial() = _Initial;
  const factory GetCustomerCategoriesState.loading() = _Loading;
  const factory GetCustomerCategoriesState.success(List<Category> categories) =
      _Success;
  const factory GetCustomerCategoriesState.failure(String message) = _Failure;
}
