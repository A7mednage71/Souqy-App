import 'package:json_annotation/json_annotation.dart';

part 'customer_notification_model.g.dart';

@JsonSerializable()
class CustomerNotificationModel {
  CustomerNotificationModel({
    required this.notificationId,
    required this.title,
    required this.body,
    required this.productId,
    required this.createdAt,
    required this.isSeen,
  });

  factory CustomerNotificationModel.fromJson(Map<String, dynamic> json) =>
      _$CustomerNotificationModelFromJson(json);

  @JsonKey(name: 'notification_id')
  final String notificationId;

  final String title;
  final String body;

  @JsonKey(name: 'product_id')
  final String productId;

  @JsonKey(name: 'created_at')
  final String createdAt;

  @JsonKey(name: 'is_seen')
  final bool isSeen;

  Map<String, dynamic> toJson() => _$CustomerNotificationModelToJson(this);
}
