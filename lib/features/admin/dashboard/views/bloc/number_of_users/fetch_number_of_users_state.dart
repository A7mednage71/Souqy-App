part of 'fetch_number_of_users_bloc.dart';

@freezed
class FetchNumberOfUsersState with _$FetchNumberOfUsersState {
  const factory FetchNumberOfUsersState.loading() = _Loading;
  const factory FetchNumberOfUsersState.success(String count) = _Success;
  const factory FetchNumberOfUsersState.failure(String message) = _Failure;
}
