part of 'create_category_bloc.dart';

@freezed
class CreateCategoryState with _$CreateCategoryState {
  const factory CreateCategoryState.initial() = _Initial;
  const factory CreateCategoryState.loading() = _Loading;
  const factory CreateCategoryState.success(
      CreateCategoryResponseModel response) = _Loaded;
  const factory CreateCategoryState.failure(String message) = _Error;
}
