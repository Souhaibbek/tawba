import 'dart:math';
import 'package:timezone/timezone.dart' as tz;

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:tawba/utils/jsons/zekr.dart';

class NotificationHelper {
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  Future<void> initialize() async {
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings(
            '@mipmap/ic_launcher'); // Replace with your app's icon

    const InitializationSettings initializationSettings =
        InitializationSettings(
      android: initializationSettingsAndroid,
    );

    await flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
    );
  }

  Future<void> schedulePeriodicNotifications() async {
    print('Scheduling random notification'); // Add this line

    final random = Random();
    int rndmID = random.nextInt(zekrData.length - 1);
    AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails(
      '$rndmID.0',
      'تطبيق توبه',
      channelDescription: 'تطبيق اذكار وادعية وتلاوة وقراءة القرءان الكريم',
      importance: Importance.high,
      priority: Priority.high,
      timeoutAfter: 30000,
      styleInformation: const BigTextStyleInformation(''),
    );

    NotificationDetails platformChannelSpecifics =
        NotificationDetails(android: androidPlatformChannelSpecifics);

    for (int i = 1; i < 280; i++) {
      final uniqueId = tz.TZDateTime.now(tz.local)
          .add(Duration(minutes: 5 * i))
          .millisecondsSinceEpoch
          .hashCode;
      final String randomZekr = zekrData[random.nextInt(zekrData.length)];
      final notificationTime = tz.TZDateTime.now(tz.local)
          .add(Duration(minutes: 5 * i)); // Schedule 15 minutes apart
      await FlutterLocalNotificationsPlugin().zonedSchedule(
        uniqueId,
        null,
        randomZekr, // Use a random zekr from the list as the notification body
        notificationTime,
        platformChannelSpecifics,
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime,
        matchDateTimeComponents: DateTimeComponents.time,
        payload: 'Periodic Notification Payload',
      );
    }
  }
}
