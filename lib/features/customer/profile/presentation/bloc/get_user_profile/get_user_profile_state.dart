part of 'get_user_profile_bloc.dart';

@freezed
class GetUserProfileState with _$GetUserProfileState {
  const factory GetUserProfileState.initial() = _Initial;
  const factory GetUserProfileState.loading() = _Loading;
  const factory GetUserProfileState.success(UserProfileModel userProfileModel) =
      _Success;
  const factory GetUserProfileState.failure({required String errorMessage}) =
      _Failure;
}
