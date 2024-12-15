part of 'fetch_number_of_categories_bloc.dart';

@freezed
class FetchNumberOfCategoriesEvent with _$FetchNumberOfCategoriesEvent {
  const factory FetchNumberOfCategoriesEvent.started() = _Started;
  const factory FetchNumberOfCategoriesEvent.fetchNumberOfCategories() =
      FetchNumberOfCategories;
}
