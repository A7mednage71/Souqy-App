import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_store/core/style/colors/colors_dark.dart';
import 'package:my_store/features/admin/users/presentation/views/widgets/table_cell_title.dart';

class UsersTable extends StatelessWidget {
  const UsersTable({super.key});

  @override
  Widget build(BuildContext context) {
    return Table(
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
        ...List.generate(
          4,
          (index) => TableRow(
            children: [
              TableCell(
                verticalAlignment: TableCellVerticalAlignment.middle,
                child: Padding(
                  padding: EdgeInsets.all(8.r),
                  child: const Text(
                    'ahmdnajkh71',
                    style: TextStyle(
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
                  child: const Text(
                    'ahmdnajkh71@gmail.com',
                    style: TextStyle(
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
          ),
        ),
      ],
    );
  }
}
