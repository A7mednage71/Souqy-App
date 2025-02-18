import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_store/core/di/dependency_injection.dart';
import 'package:my_store/features/customer/profile/presentation/bloc/get_user_profile/get_user_profile_bloc.dart';
import 'package:my_store/features/customer/profile/presentation/views/widgets/user_profile_info_bloc_builder.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<GetUserProfileBloc>()
        ..add(const GetUserProfileEvent.getUserProfile()),
      child: const Column(
        children: [
          UserProfileInfoBlocBuilder(),
        ],
      ),
    );
  }
}
