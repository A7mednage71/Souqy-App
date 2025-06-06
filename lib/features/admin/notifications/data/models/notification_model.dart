import 'package:hive_flutter/hive_flutter.dart';

part 'notification_model.g.dart';

@HiveType(typeId: 0)
class NotificationModel extends HiveObject {
  NotificationModel({
    required this.title,
    required this.body,
    required this.productId,
    required this.createdAt,
  });
  @HiveField(0)
  String title;

  @HiveField(1)
  String body;

  @HiveField(2)
  int productId;

  @HiveField(3)
  final DateTime createdAt;
}
