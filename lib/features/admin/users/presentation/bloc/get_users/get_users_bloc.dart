import 'dart:async';

import 'package:flutter/material.dart';
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
    on<SearchUsers>(searchInUsers);
  }
  final UsersRepo _userRepo;
  final TextEditingController searchController = TextEditingController();

  List<UserModel> usersList = [];

  FutureOr<void> getUsers(GetUsers event, Emitter<GetUsersState> emit) async {
    emit(const GetUsersState.loading());
    final result = await _userRepo.getUsers();
    result.when(
      success: (response) {
        usersList = response.usersData.users;
        emit(GetUsersState.success(usersList));
      },
      failure: (error) => emit(GetUsersState.failure(error.errMessages)),
    );
  }

  FutureOr<void> searchInUsers(
    SearchUsers event,
    Emitter<GetUsersState> emit,
  ) async {
    final searhText = searchController.text.toLowerCase().trim();

    final users = usersList
        .where(
          (user) =>
              user.userName.toLowerCase().contains(searhText) ||
              user.userEmail.toLowerCase().contains(searhText),
        )
        .toList();

    emit(GetUsersState.success(users));
  }
}
