part of 'fetch_number_of_users_bloc.dart';

@freezed
class FetchNumberOfUsersEvent with _$FetchNumberOfUsersEvent {
  const factory FetchNumberOfUsersEvent.started() = _Started;
  const factory FetchNumberOfUsersEvent.fetchNumberOfUsers() =
      FetchNumberOfUsers;
}
