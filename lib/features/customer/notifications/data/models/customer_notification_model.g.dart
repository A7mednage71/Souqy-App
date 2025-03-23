// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer_notification_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CustomerNotificationModel _$CustomerNotificationModelFromJson(
        Map<String, dynamic> json) =>
    CustomerNotificationModel(
      notificationId: json['notification_id'] as String,
      title: json['title'] as String,
      body: json['body'] as String,
      productId: json['product_id'] as String,
      createdAt: json['created_at'] as String,
      isSeen: json['is_seen'] as bool,
    );

Map<String, dynamic> _$CustomerNotificationModelToJson(
        CustomerNotificationModel instance) =>
    <String, dynamic>{
      'notification_id': instance.notificationId,
      'title': instance.title,
      'body': instance.body,
      'product_id': instance.productId,
      'created_at': instance.createdAt,
      'is_seen': instance.isSeen,
    };
