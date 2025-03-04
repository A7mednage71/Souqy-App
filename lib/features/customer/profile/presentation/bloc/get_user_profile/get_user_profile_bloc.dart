import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_store/features/customer/profile/data/models/user_profile_model.dart';
import 'package:my_store/features/customer/profile/data/repos/profile_repo.dart';

part 'get_user_profile_bloc.freezed.dart';
part 'get_user_profile_event.dart';
part 'get_user_profile_state.dart';

class GetUserProfileBloc
    extends Bloc<GetUserProfileEvent, GetUserProfileState> {
  GetUserProfileBloc(this._profileRepo)
      : super(const GetUserProfileState.initial()) {
    on<GetUserProfile>(getUserProfile);
  }

  final ProfileRepo _profileRepo;

  FutureOr<void> getUserProfile(
    GetUserProfile event,
    Emitter<GetUserProfileState> emit,
  ) async {
    emit(const GetUserProfileState.loading());
    final result = await _profileRepo.getUserProfile();
    result.when(
      success: (myProfile) => emit(GetUserProfileState.success(myProfile)),
      failure: (error) =>
          emit(GetUserProfileState.failure(errorMessage: error.errMessages)),
    );
  }
}
