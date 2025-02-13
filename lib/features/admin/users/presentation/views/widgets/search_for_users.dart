import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_store/core/common/widgets/custom_text_field.dart';
import 'package:my_store/features/admin/users/presentation/bloc/get_users/get_users_bloc.dart';

class SearchForUser extends StatelessWidget {
  const SearchForUser({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetUsersBloc, GetUsersState>(
      builder: (context, state) {
        final getUsersBloc = context.read<GetUsersBloc>();
        return CustomTextField(
          controller: getUsersBloc.searchController,
          hintText: 'Search for users',
          onChanged: (value) {
            getUsersBloc.add(const GetUsersEvent.searchUsers());

            return null;
          },
          suffixIcon: IconButton(
            onPressed: () {
              getUsersBloc.searchController.clear();
              getUsersBloc.add(const GetUsersEvent.getUsers());
            },
            icon: getUsersBloc.searchController.text.isNotEmpty
                ? const Icon(
                    Icons.clear,
                    color: Colors.blue,
                  )
                : const Icon(
                    Icons.search,
                    color: Colors.grey,
                  ),
          ),
        );
      },
    );
  }
}
