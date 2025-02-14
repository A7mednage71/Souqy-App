// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_request_body_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NotificationContent _$NotificationContentFromJson(Map<String, dynamic> json) =>
    NotificationContent(
      title: json['title'] as String,
      body: json['body'] as String,
    );

Map<String, dynamic> _$NotificationContentToJson(
        NotificationContent instance) =>
    <String, dynamic>{
      'title': instance.title,
      'body': instance.body,
    };

NotificationData _$NotificationDataFromJson(Map<String, dynamic> json) =>
    NotificationData(
      productId: json['productId'] as String,
      type: json['type'] as String?,
      clickAction:
          json['click_action'] as String? ?? 'FLUTTER_NOTIFICATION_CLICK',
    );

Map<String, dynamic> _$NotificationDataToJson(NotificationData instance) =>
    <String, dynamic>{
      'type': instance.type,
      'productId': instance.productId,
      'click_action': instance.clickAction,
    };
