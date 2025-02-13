import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_store/features/admin/users/data/models/get_users_response_model.dart';
import 'package:my_store/features/admin/users/data/repos/users_repo.dart';

part 'get_users_bloc.freezed.dart';
part 'get_users_event.dart';
part 'get_users_state.dart';

class GetUsersBloc extends Bloc<GetUsersEvent, GetUsersState> {
  GetUsersBloc(this._userRepo) : super(const GetUsersState.initial()) {
    on<GetUsers>(getUsers);
  }
  final UsersRepo _userRepo;
  FutureOr<void> getUsers(GetUsers event, Emitter<GetUsersState> emit) async {
    emit(const GetUsersState.loading());
    final result = await _userRepo.getUsers();
    result.when(
      success: (response) =>
          emit(GetUsersState.success(response.usersData.users)),
      failure: (error) => emit(GetUsersState.failure(error.errMessages)),
    );
  }
}
