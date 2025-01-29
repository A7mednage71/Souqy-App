part of 'delete_category_bloc.dart';

@freezed
class DeleteCategoryState with _$DeleteCategoryState {
  const factory DeleteCategoryState.initial() = _Initial;
  const factory DeleteCategoryState.loading({required String id}) = _Loading;
  const factory DeleteCategoryState.success() = _Success;
  const factory DeleteCategoryState.failure(String message) = _Failure;
}
