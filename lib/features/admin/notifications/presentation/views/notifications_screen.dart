import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_store/core/common/widgets/custom_admin_appbar.dart';
import 'package:my_store/core/di/dependency_injection.dart';
import 'package:my_store/core/extensions/theme_context.dart';
import 'package:my_store/features/admin/notifications/presentation/bloc/get_notifications/get_notifications_bloc.dart';
import 'package:my_store/features/admin/notifications/presentation/bloc/send_notification/send_notification_bloc.dart';
import 'package:my_store/features/admin/notifications/presentation/views/widgets/add_notification_item.dart';
import 'package:my_store/features/admin/notifications/presentation/views/widgets/notifications_list_view.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt<GetNotificationsBloc>()
            ..add(const GetNotificationsEvent.getNotifications()),
        ),
        BlocProvider(
          create: (context) => getIt<SendNotificationBloc>(),
        ),
      ],
      child: Scaffold(
        appBar: const CustomAdminAppBar(title: 'Notifications'),
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(
                context.themeAssets.homeBg!,
              ),
            ),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 20.h),
            child: Column(
              children: [
                const AddNotificationItem(),
                SizedBox(height: 20.h),
                const Expanded(child: NotificationsListView()),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
