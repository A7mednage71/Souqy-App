import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_store/features/auth/login/data/models/login_request_model.dart';
import 'package:my_store/features/auth/login/data/repos/login_repo.dart';

part 'login_bloc.freezed.dart';
part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc(this._loginRepo) : super(const _Initial()) {
    on<LoginEvent>(login);
  }
  final LoginRepo _loginRepo;

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  FutureOr<void> login(LoginEvent event, Emitter<LoginState> emit) async {
    emit(const LoginState.loading());
    final result = await _loginRepo.login(
      loginRequest: LoginRequestModel(
        email: email.text.trim(),
        password: password.text.trim(),
      ),
    );

    result.when(
      success: (success) {
        emit(const LoginState.success());
      },
      failure: (failure) => emit(LoginState.failure(failure.errMessages)),
    );
  }
}
