part of 'fetch_number_of_categories_bloc.dart';

@freezed
class FetchNumberOfCategoriesState with _$FetchNumberOfCategoriesState {
  const factory FetchNumberOfCategoriesState.loading() = _Loading;
  const factory FetchNumberOfCategoriesState.success(String count) = _Success;
  const factory FetchNumberOfCategoriesState.failure(String message) = _Failure;
}
