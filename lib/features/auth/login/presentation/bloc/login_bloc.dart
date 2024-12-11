import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_store/core/networking/dio_factory.dart';
import 'package:my_store/core/services/secure_storage/secure_storage.dart';
import 'package:my_store/core/services/secure_storage/secure_storage_keys.dart';
import 'package:my_store/core/services/shared_pref/shared_pref.dart';
import 'package:my_store/core/services/shared_pref/shared_pref_keys.dart';
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

  GlobalKey<FormState> formKey = GlobalKey();

  FutureOr<void> login(LoginEvent event, Emitter<LoginState> emit) async {
    emit(const LoginState.loading());
    final result = await _loginRepo.login(
      loginRequest: LoginRequestModel(
        email: email.text.trim(),
        password: password.text.trim(),
      ),
    );

    result.when(
      success: (loginResponse) async {
        // get token and save it to secure storage
        final accessToken = loginResponse.userData.login.accessToken;
        await SecureStorage.setSecuredData(
          SecureStorageKeys.accessToken,
          accessToken ?? '',
        );
        // refresh dio with the new access token
        await DioFactory.refreshHeaders(token: accessToken ?? '');
        // get user role
        final user = await _loginRepo.userRole();
        // save user id and user role to shared storage to use in get profile
        await SharedPrefService.setData(SharedPrefKeys.userId, user.userId);
        await SharedPrefService.setData(SharedPrefKeys.userRole, user.userRole);
        emit(LoginState.success(user.userRole));
      },
      failure: (failure) => emit(LoginState.failure(failure.errMessages)),
    );
  }
}
