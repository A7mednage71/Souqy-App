import 'package:hive_flutter/hive_flutter.dart';
import 'package:my_store/core/services/hive_database/hive_boxes.dart';
import 'package:my_store/features/admin/notifications/data/models/notification_model.dart';

class HiveDatabase {
  // notifications box
  static Box<NotificationModel>? notificationsBox;

  // init flutter
  static Future<void> init() async {
    await Hive.initFlutter();
    Hive.registerAdapter(NotificationModelAdapter());
    notificationsBox =
        await Hive.openBox<NotificationModel>(HiveBoxes.notifications);
  }

  // clear notifications database
  static Future<void> clearDB() async {
    await notificationsBox!.clear();
  }
}
