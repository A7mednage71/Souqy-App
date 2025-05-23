part of 'update_category_bloc.dart';

@freezed
class UpdateCategoryState with _$UpdateCategoryState {
  const factory UpdateCategoryState.initial() = _Initial;
  const factory UpdateCategoryState.loading() = _Loading;
  const factory UpdateCategoryState.success() = _Success;
  const factory UpdateCategoryState.failure(String message) = _Failure;
}
