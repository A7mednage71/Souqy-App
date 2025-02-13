import 'package:json_annotation/json_annotation.dart';
part 'notification_request_body_model.g.dart';

class NotificationPayload {
  NotificationPayload({
    required this.fcmToken,
    required this.notification,
    required this.data,
  });
  final String fcmToken;
  final NotificationContent notification;
  final NotificationData data;

  Map<String, dynamic> toMap() {
    return {
      'message': {
        'token': fcmToken,
        'notification': notification.toJson(),
        'android': {
          'notification': {
            'notification_priority': 'PRIORITY_MAX',
            'sound': 'default',
          },
        },
        'apns': {
          'payload': {
            'aps': {
              'content_available': true,
            },
          },
        },
        'data': data.toJson(),
      },
    };
  }
}

@JsonSerializable()
class NotificationContent {
  NotificationContent({
    required this.title,
    required this.body,
  });

  final String title;
  final String body;

  Map<String, dynamic> toJson() => _$NotificationContentToJson(this);
}

@JsonSerializable()
class NotificationData {
  NotificationData({
    this.type,
    this.id,
    this.clickAction = 'FLUTTER_NOTIFICATION_CLICK',
  });

  final String? type;
  final String? id;
  @JsonKey(name: 'click_action', defaultValue: 'FLUTTER_NOTIFICATION_CLICK')
  final String clickAction;

  Map<String, dynamic> toJson() => _$NotificationDataToJson(this);
}
