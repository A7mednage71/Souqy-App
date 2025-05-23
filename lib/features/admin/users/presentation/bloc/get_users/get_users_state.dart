part of 'get_users_bloc.dart';

@freezed
class GetUsersState with _$GetUsersState {
  const factory GetUsersState.initial() = _Initial;
  const factory GetUsersState.loading() = _Loading;
  const factory GetUsersState.success(List<UserModel> users) = _Success;
  const factory GetUsersState.failure(String message) = _Failure;
}
