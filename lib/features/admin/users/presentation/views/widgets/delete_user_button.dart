import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:my_store/features/admin/users/presentation/bloc/delete_user/delete_user_bloc.dart';
import 'package:my_store/features/admin/users/presentation/bloc/get_users/get_users_bloc.dart';
import 'package:my_store/features/auth/widgets/show_toast.dart';

class DeleteUserButton extends StatelessWidget {
  const DeleteUserButton({
    required this.userId,
    super.key,
  });
  final String userId;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DeleteUserBloc, DeleteUserState>(
      listener: (context, state) {
        state.whenOrNull(
          failure: (message) {
            ShowToast.showFailureToast(
              message,
            );
          },
          success: () {
            context.read<GetUsersBloc>().add(const GetUsersEvent.getUsers());
            ShowToast.showSuccessToast(
              'User deleted successfully',
            );
          },
        );
      },
      builder: (context, state) {
        return state.maybeWhen(
          loadingAtUser: (userId) {
            if (userId == this.userId) {
              return Center(
                child: SpinKitDualRing(
                  color: Colors.white,
                  size: 20.r,
                ),
              );
            }
            return const IconButton(
              onPressed: null,
              icon: Icon(Icons.delete, color: Colors.red),
            );
          },
          orElse: () {
            return IconButton(
              onPressed: () {
                context
                    .read<DeleteUserBloc>()
                    .add(DeleteUserEvent.deleteUser(userId: userId));
              },
              icon: const Icon(Icons.delete, color: Colors.red),
            );
          },
        );
      },
    );
  }
}
