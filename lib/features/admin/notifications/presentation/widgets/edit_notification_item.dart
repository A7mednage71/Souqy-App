import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_store/core/style/colors/colors_dark.dart';
import 'package:my_store/features/admin/notifications/presentation/widgets/edit_notification_bottom_sheet.dart';

class EditNotificationItem extends StatelessWidget {
  const EditNotificationItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        showEditNotificationBottomSheet(context);
      },
      icon: const Icon(
        Icons.edit,
        color: Colors.yellow,
      ),
    );
  }

  void showEditNotificationBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: ColorsDark.blueDark,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.r),
      ),
      builder: (context) {
        return const EditNotificationBottomSheet();
      },
    );
  }
}
