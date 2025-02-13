import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_store/features/admin/users/data/repos/users_repo.dart';

part 'delete_user_bloc.freezed.dart';
part 'delete_user_event.dart';
part 'delete_user_state.dart';

class DeleteUserBloc extends Bloc<DeleteUserEvent, DeleteUserState> {
  DeleteUserBloc(this._usersRepo) : super(const DeleteUserState.initial()) {
    on<DeleteUser>(deleteUser);
  }

  final UsersRepo _usersRepo;

  FutureOr<void> deleteUser(
    DeleteUser event,
    Emitter<DeleteUserState> emit,
  ) async {
    emit(DeleteUserState.loadingAtUser(userId: event.userId));

    final result = await _usersRepo.deleteUser(userId: event.userId);
    result.when(
      success: (response) => emit(const DeleteUserState.success()),
      failure: (error) => emit(DeleteUserState.failure(error.errMessages)),
    );
  }
}
