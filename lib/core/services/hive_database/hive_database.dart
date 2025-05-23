import 'package:hive_flutter/hive_flutter.dart';
import 'package:my_store/core/services/hive_database/hive_boxes.dart';
import 'package:my_store/features/admin/notifications/data/models/notification_model.dart';
import 'package:my_store/features/customer/favorites/data/models/favorites_model.dart';

class HiveDatabase {
  // notifications box
  static Box<NotificationModel>? notificationsBox;
  // favorites box
  static Box<FavoritesModel>? favoritesBox;

  // init flutter
  static Future<void> init() async {
    await Hive.initFlutter();
    Hive
      ..registerAdapter(NotificationModelAdapter())
      ..registerAdapter(FavoritesModelAdapter());
    notificationsBox =
        await Hive.openBox<NotificationModel>(HiveBoxes.notifications);
    favoritesBox = await Hive.openBox<FavoritesModel>(HiveBoxes.favorites);
  }

  // clear notifications database
  static Future<void> clearDB() async {
    await notificationsBox!.clear();
    await favoritesBox!.clear();
  }
}
