part of 'sighn_up_bloc.dart';

@freezed
class SighnUpState with _$SighnUpState {
  const factory SighnUpState.initial() = _Initial;
  const factory SighnUpState.loading() = _Loading;
  const factory SighnUpState.success() = _Success;
  const factory SighnUpState.failure(String message) = _Failure;
}
