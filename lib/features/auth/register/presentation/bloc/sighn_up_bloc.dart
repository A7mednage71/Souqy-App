import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_store/features/auth/register/data/models/sighn_up_request_model.dart';
import 'package:my_store/features/auth/register/data/repos/sighn_up_repo.dart';

part 'sighn_up_bloc.freezed.dart';
part 'sighn_up_event.dart';
part 'sighn_up_state.dart';

class SighnUpBloc extends Bloc<SighnUpEvent, SighnUpState> {
  SighnUpBloc(this._sighnUpRepo) : super(const SighnUpState.initial()) {
    on<SignUp>(sighnUp);
  }

  final SighnUpRepo _sighnUpRepo;

  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey();

  FutureOr<void> sighnUp(SignUp event, Emitter<SighnUpState> emit) async {
    emit(const SighnUpState.loading());
    final result = await _sighnUpRepo.sighnUp(
      requestModel: SighnUpRequestModel(
        name: name.text.trim(),
        email: email.text.trim(),
        password: password.text.trim(),
        avatar: event.avatar,
      ),
    );

    result.when(
      success: (success) {
        emit(const SighnUpState.success());
      },
      failure: (failure) {
        emit(SighnUpState.failure(failure.errMessages));
      },
    );
  }
}
