part of 'delete_user_bloc.dart';

@freezed
class DeleteUserState with _$DeleteUserState {
  const factory DeleteUserState.initial() = _Initial;
  const factory DeleteUserState.loadingAtUser({required String userId}) =
      _LoadingAtUser;
  const factory DeleteUserState.success() = _Success;
  const factory DeleteUserState.failure(String message) = _Failure;
}
