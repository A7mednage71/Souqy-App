import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_store/features/admin/dashboard/data/repos/dashboard_repo.dart';

part 'fetch_number_of_users_bloc.freezed.dart';
part 'fetch_number_of_users_event.dart';
part 'fetch_number_of_users_state.dart';

class FetchNumberOfUsersBloc
    extends Bloc<FetchNumberOfUsersEvent, FetchNumberOfUsersState> {
  FetchNumberOfUsersBloc(this._dashboardRepo)
      : super(const FetchNumberOfUsersState.loading()) {
    on<FetchNumberOfUsers>(_fetchNumberOfUsers);
  }

  final DashboardRepo _dashboardRepo;

  FutureOr<void> _fetchNumberOfUsers(
    FetchNumberOfUsers event,
    Emitter<FetchNumberOfUsersState> emit,
  ) async {
    emit(const FetchNumberOfUsersState.loading());
    final result = await _dashboardRepo.numberOfUsers();
    result.when(
      success: (response) =>
          emit(FetchNumberOfUsersState.success(response.numberofUsers)),
      failure: (error) =>
          emit(FetchNumberOfUsersState.failure(error.errMessages)),
    );
  }
}
