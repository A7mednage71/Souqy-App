import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:googleapis_auth/auth_io.dart' as auth;
import 'package:my_store/core/extensions/localization_context.dart';
import 'package:my_store/core/languages/localization_keys.dart';
import 'package:my_store/core/routes/routes.dart';
import 'package:my_store/core/services/cloud_messaging/notification_request_body_model.dart';
import 'package:my_store/core/services/local_notifications/local_notifications.dart';
import 'package:my_store/features/auth/widgets/show_toast.dart';
import 'package:my_store/my_store.dart';

class FirebaseMessagingHelper {
  FirebaseMessagingHelper._();

  static final FirebaseMessagingHelper instance = FirebaseMessagingHelper._();

  // create instance of FCM
  final fcm = FirebaseMessaging.instance;
  static const String subscribeKey = 'Souqy';

  bool isPermissionGranted = false;
  ValueNotifier<bool> isTopicSubscribed = ValueNotifier<bool>(false);

  /// init FCM
  Future<void> initNotifications() async {
    await requestPermission();
    final firebaseMessagingToken = await fcm.getToken();
    log('firebaseMessagingToken : $firebaseMessagingToken');
    await handelForegroundNotification();
    await handelBackgroundNotificationClick();
    await handelterminatedNotificationClick();
  }

  // request permission
  Future<void> requestPermission() async {
    final settings = await fcm.requestPermission();
    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      isPermissionGranted = true;
      await _subscribeToTopic();
      log('🔔🔔 User accepted the notification permission 🔔🔔');
    } else {
      isPermissionGranted = false;
      log('🔕🔕 User not accepted the notification permission 🔕🔕');
    }
  }

  // control user subscription
  Future<void> controlUserSubscription(BuildContext context) async {
    if (!isPermissionGranted) {
      await requestPermission();
    } else {
      if (isTopicSubscribed.value) {
        await unsubscribeFromTopic();
        if (!context.mounted) return;
        ShowToast.showSuccessToast(
          context.translate(LocalizationKeys.unsubscribedToNotifications),
        );
      } else {
        await _subscribeToTopic();
        if (!context.mounted) return;
        ShowToast.showSuccessToast(
          context.translate(LocalizationKeys.subscribedToNotifications),
        );
      }
    }
  }

  Future<void> _subscribeToTopic() async {
    isTopicSubscribed.value = true;
    await FirebaseMessaging.instance.subscribeToTopic(subscribeKey);
    log('====🔔 Notification Subscribed 🔔=====');
  }

  Future<void> unsubscribeFromTopic() async {
    isTopicSubscribed.value = false;
    await FirebaseMessaging.instance.unsubscribeFromTopic(subscribeKey);
    log('====🔕 Notification Unsubscribed 🔕=====');
  }

  /// handel Foreground Notification
  Future<void> handelForegroundNotification() async {
    FirebaseMessaging.onMessage.listen(handleMessage);
  }

  /// handle FCM message
  Future<void> handleMessage(RemoteMessage? message) async {
    log('Foreground Notification Called');
    if (message == null) return;
    if (message.notification != null) {
      await LocalNotifications.showNotification(
        title: message.notification!.title!,
        body: message.notification!.body!,
        payload: message.data['productId'].toString(),
      );
    }
  }

  Future<void> handelBackgroundNotificationClick() async {
    FirebaseMessaging.onMessageOpenedApp.listen(handleMessageOpen);
  }

  /// handle Interaction with FCM message
  void handleMessageOpen(RemoteMessage? message) {
    log('Background Notification Click Called');
    if (message == null) return;
    if (message.notification != null) {
      final productId = message.data['productId'].toString();
      if (productId == '-1') return;
      navigatorKey.currentState
          ?.pushNamed(Routes.productDetails, arguments: productId);
    }
  }

  Future<void> handelterminatedNotificationClick() async {
    await FirebaseMessaging.instance.getInitialMessage().then((message) {
      log('terminated Notification Called');
      if (message != null) {
        final productId = message.data['productId'].toString();

        if (productId == '-1') return;
        navigatorKey.currentState
            ?.pushNamed(Routes.productDetails, arguments: productId);
      }
    });
  }

  /// get access token
  Future<String?> getAccessToken() async {
    final serviceAccountJson = {
      'type': 'service_account',
      'project_id': 'my-store-a9846',
      'private_key_id': '344dbdf733a88d375bb1628c00e9994dadcea2dd',
      'private_key':
          '-----BEGIN PRIVATE KEY-----\nMIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQC6dctI5QWzZaDD\nbtJoN+bsZyRHcIFULFWO6SNGmjUfrpBDbiS81WQrF0WqlBFM5e8g9u4a142O7y34\n62qXR9sZQwzYtVFFW1kkipaZhAyeZGoaTSUv0OOD7feJFA5Muu26EuJGgbxg0QT/\n5DDqN7GPCsWm+nkNh5f97UV8/YlZl+zK27QtVxNNCIwoTIuI5ifVWPRV5DDJP9H8\nvigoOYqnrxFEf6dmuMNf/zgANW5NsVXR3jI+VOgpF1rww5VnKk02RA01WMB3+NaR\ns+s4QlWPrkRXunLwUKmohXowDnH0xuz4rm+0BP8vpWvXmqr9Im59iAkb+W2AGlg7\nzFkqz0wDAgMBAAECggEAUF1NyTTAoMIoKKN+t2GEu5Z22f2hGDzlgWt1g0waonWU\nAyQZXHQisLnekncv/7NIvi3/kP0fq5/l8hfRQLO9OKWgB1Ua2qhVAv1ijHcQE0KX\nQo/Ge9XuAaJSorfMtACLTrwt35KyNQ5Rt9LLzF9Fva+4YdAp1Y2AEncuEIGcLcsh\nwK8C/cbKx0amUxtbxQWk2W65Cr3fE8YWBbQVVCLESm4YrxqMkLzT9/qJRGZDQAiq\n0yQkk3+QxrmvkD2Yw8t2jbqW3UxcmE0DP2Km5mdr+K33MxFO5Fv1dMZnyDeT77og\nNF+G8PY4Yph4OGBjK/hoLyJQSZjn9p5i5zgFFvHHhQKBgQD54oXdf4Mop6oekM5n\nddE7yCT9cw12WtqGzhCZAu6xdQsGB+3vJTdz73U5arP1sQcagkvSnnW02qALi2y5\nHGUp3ubWcV0odDCrvmN2JEWckvyg+NWbN2no4GTr9Svei8t9YXPc7Kw9wF4fhly+\nkQ4vGorQpDYpCMusOaQFWDA0jwKBgQC/Be2pW0UM5jPCHJPl3wmvXn0vZ1nIKRRw\neWgTrEbhJPO5scCqOBgWEU3j92L6IldqJV6wfQu2ENsL7lgiQow8qD8GJKk5nez1\nWF7AcjC7buXxNoyyE8mFlGRS/PeqCITRrit8KpvHRLg67BQ0rcWkZz1fzWcJXGsl\n2x1RSjkzTQKBgQDeMxOeFljmudCIRXOEhDt90UczKC98YuWWoX4Y0Ya2vcEDp+Fn\nmcxphzDR0ZQckUIjzGDn9IfuPcm6+ku/fwRl6xOQ9FVGN6tfzHhdAXv08q855Irs\n7qV6sq6LMwPDbMORxipk9P9kGb6Ygb3OpuXZ9NwjEyIl8vBJQSgcqIKU+QKBgHR2\n09jeqbHcpI/jxpRvMMN4M5D0TTwJN8n/a2IbNjfMxMBhzJq7iovhzwB/cxwYVf2E\nfT/TbZF6o2KZ1ahFtKTC23IOZhKX48ION+7TcDzGt3EilhN4lvRXbfde/kzv1rLU\novSYMdQDZOOfzg30KL08qKHBZOHDNBynhC9stoU9AoGAVO0gXaJ5OrJwFKLe1Qvc\nOyZN/cOUo5Ej10iFJa2z+MqdiBm3mUwZIbzn5suahAntwHUj4ijG3Md4TU4Sl1IS\nka+OttgVDUNh8z+5Lwrkxu3q93V4fCJoyoNacBrArBwpIs76rQs2a5sgt7fCtVQw\nZHy0XZtEV8BD7C1zjFtwDOo=\n-----END PRIVATE KEY-----\n',
      'client_email':
          'firebase-adminsdk-de3p0@my-store-a9846.iam.gserviceaccount.com',
      'client_id': '112485226283384740431',
      'auth_uri': 'https://accounts.google.com/o/oauth2/auth',
      'token_uri': 'https://oauth2.googleapis.com/token',
      'auth_provider_x509_cert_url':
          'https://www.googleapis.com/oauth2/v1/certs',
      'client_x509_cert_url':
          'https://www.googleapis.com/robot/v1/metadata/x509/firebase-adminsdk-de3p0%40my-store-a9846.iam.gserviceaccount.com',
      'universe_domain': 'googleapis.com',
    };

    final scopes = <String>[
      'https://www.googleapis.com/auth/userinfo.email',
      'https://www.googleapis.com/auth/firebase.database',
      'https://www.googleapis.com/auth/firebase.messaging',
    ];

    try {
      final client = await auth.clientViaServiceAccount(
        auth.ServiceAccountCredentials.fromJson(serviceAccountJson),
        scopes,
      );

      final credentials = await auth.obtainAccessCredentialsViaServiceAccount(
        auth.ServiceAccountCredentials.fromJson(serviceAccountJson),
        scopes,
        client,
      );

      client.close();
      log('Access Token: ${credentials.accessToken.data}');
      return credentials.accessToken.data;
    } catch (e) {
      log('Error getting access token: $e');
      return null;
    }
  }

  Future<void> sendNotificationsToTopic({
    required String title,
    required String notificationBody,
    required String productId,
    String? topic,
  }) async {
    try {
      final serverKeyAuthorization = await getAccessToken();
      const urlEndPoint =
          'https://fcm.googleapis.com/v1/projects/my-store-a9846/messages:send';

      final dio = Dio();
      dio.options.headers['Content-Type'] = 'application/json';
      dio.options.headers['Authorization'] = 'Bearer $serverKeyAuthorization';

      final response = await dio.post(
        urlEndPoint,
        data: NotificationPayload(
          fcmToken: '/topics/${topic ?? subscribeKey}',
          data: NotificationData(
            productId: productId,
          ),
          notification: NotificationContent(
            title: title,
            body: notificationBody,
          ),
        ).toMap(),
      );

      log('Response Status Code: ${response.statusCode}');
      log('Response Data: ${response.data}');
    } catch (e) {
      log('Error sending notification: $e');
    }
  }
}
