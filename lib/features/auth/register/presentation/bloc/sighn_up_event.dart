part of 'sighn_up_bloc.dart';

@freezed
class SighnUpEvent with _$SighnUpEvent {
  const factory SighnUpEvent.started() = _Started;
  const factory SighnUpEvent.signUp({required String avatar}) = SignUp;
}
