import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class LocalNotification {
  static FlutterLocalNotificationsPlugin flutterLocalNoti =
      FlutterLocalNotificationsPlugin();
  static foreground(NotificationResponse notificationResponse) {}
  static Future initialize() async {
    InitializationSettings object = const InitializationSettings(
      android: AndroidInitializationSettings("@mipmap/ic_launcher"),
      iOS: DarwinInitializationSettings(),
    );
    flutterLocalNoti.initialize(
      object,
      onDidReceiveBackgroundNotificationResponse: foreground,
    );
  }

  static void localNotification() async {
    NotificationDetails info = const NotificationDetails(
        android: AndroidNotificationDetails(
      "id 1",
      "Local notification",
      importance: Importance.max,
      priority: Priority.high,
    ));
    await flutterLocalNoti.show(
      0, "done", "Success to rejester.", info,
      // payload: "payload data",
    );
  }
}
