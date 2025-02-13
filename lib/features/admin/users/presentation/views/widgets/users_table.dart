import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_store/core/style/colors/colors_dark.dart';
import 'package:my_store/features/admin/users/data/models/get_users_response_model.dart';
import 'package:my_store/features/admin/users/presentation/bloc/get_users/get_users_bloc.dart';
import 'package:my_store/features/admin/users/presentation/views/widgets/table_cell_title.dart';

class UsersTable extends StatelessWidget {
  const UsersTable({required this.users, super.key});
  final List<UserModel> users;
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        context.read<GetUsersBloc>().add(const GetUsersEvent.getUsers());
      },
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Table(
          defaultVerticalAlignment: TableCellVerticalAlignment.middle,
          border: TableBorder.all(color: ColorsDark.blueLight),
          columnWidths: {
            0: FixedColumnWidth(100.w),
            1: const FlexColumnWidth(),
            2: FixedColumnWidth(110.w),
          },
          children: [
            const TableRow(
              decoration: BoxDecoration(color: ColorsDark.blueDark),
              children: [
                TableCell(
                  verticalAlignment: TableCellVerticalAlignment.middle,
                  child: TableCellTitle(title: 'Name', icon: Icons.person),
                ),
                TableCell(
                  verticalAlignment: TableCellVerticalAlignment.middle,
                  child: TableCellTitle(title: 'Email', icon: Icons.email),
                ),
                TableCell(
                  verticalAlignment: TableCellVerticalAlignment.middle,
                  child: TableCellTitle(title: 'Delete', icon: Icons.delete),
                ),
              ],
            ),
            ...List.generate(users.length, (index) {
              return TableRow(
                children: [
                  TableCell(
                    verticalAlignment: TableCellVerticalAlignment.middle,
                    child: Padding(
                      padding: EdgeInsets.all(8.r),
                      child: Text(
                        users[index].userName,
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                      ),
                    ),
                  ),
                  TableCell(
                    verticalAlignment: TableCellVerticalAlignment.middle,
                    child: Padding(
                      padding: EdgeInsets.all(8.r),
                      child: Text(
                        users[index].userEmail,
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                        maxLines: 2,
                      ),
                    ),
                  ),
                  TableCell(
                    verticalAlignment: TableCellVerticalAlignment.middle,
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.delete, color: Colors.red),
                    ),
                  ),
                ],
              );
            }),
          ],
        ),
      ),
    );
  }
}
