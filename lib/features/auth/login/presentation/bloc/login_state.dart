part of 'login_bloc.dart';

@freezed
class LoginState with _$LoginState {
  const factory LoginState.initial() = _Initial;
  const factory LoginState.loading() = _Loading;
  const factory LoginState.failure(String message) = _Failure;
  const factory LoginState.success() = _Success;
}
