import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_store/core/common/screens/failure_state.dart';
import 'package:my_store/features/customer/profile/presentation/bloc/get_user_profile/get_user_profile_bloc.dart';
import 'package:my_store/features/customer/profile/presentation/views/widgets/user_profile_info.dart';
import 'package:skeletonizer/skeletonizer.dart';

class UserProfileInfoBlocBuilder extends StatelessWidget {
  const UserProfileInfoBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetUserProfileBloc, GetUserProfileState>(
      builder: (context, state) {
        return state.when(
          initial: SizedBox.shrink,
          failure: (message) => const FailureState(),
          success: (user) => UserProfileInfo(user: user),
          loading: () => const Skeletonizer(
            child: UserProfileInfo(
              user: null,
            ),
          ),
        );
      },
    );
  }
}
