import 'dart:async';
import 'dart:developer';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class LocalNotifications {
  static FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  /// create stream connection
  static StreamController<NotificationResponse> streamController =
      StreamController();

  /// handle notification response
  static void receiveNotificationResponse(
    NotificationResponse notificationResponse,
  ) {
    streamController.add(notificationResponse);
    log('Receive Notification Response');
  }

  /// Initialize the notification service
  static Future<void> initialize() async {
    // request permission
    await requestPermission();
    // initialize local notification
    const settings = InitializationSettings(
      android: AndroidInitializationSettings('@mipmap/ic_launcher'),
      iOS: DarwinInitializationSettings(),
    );
    await flutterLocalNotificationsPlugin.initialize(
      settings,
      onDidReceiveNotificationResponse: receiveNotificationResponse,
      onDidReceiveBackgroundNotificationResponse: receiveNotificationResponse,
    );
    log('Initializing Local Notification');
  }

  /// request permission
  static Future<void> requestPermission() async {
    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()!
        .requestNotificationsPermission();
    log('Request Permission');
  }

  /// show notification
  static Future<void> showNotification({
    required String title,
    required String body,
    String? payload,
  }) async {
    await flutterLocalNotificationsPlugin.show(
      0,
      title,
      body,
      const NotificationDetails(
        android: AndroidNotificationDetails(
          'Souqy_id',
          'Souqy',
          importance: Importance.max,
          priority: Priority.high,
        ),
        iOS: DarwinNotificationDetails(
          presentAlert: true,
          presentBadge: true,
          presentSound: true,
        ),
      ),
      payload: payload,
    );
  }

  //   void listenToNotifications() {
  //   LocalNotificationService.streamController.stream.listen((event) {
  //     Navigator.push(context, MaterialPageRoute(
  //       builder: (context) {
  //         return NotificationsScreenDetails(notificationResponse: event);
  //       },
  //     ));
  //   });
  // }
}
