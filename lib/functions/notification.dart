import 'dart:math';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:tawba/utils/jsons/zekr.dart';

class NotificationHelper {
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  final notificationInterval = const Duration(minutes: 5);
  final random = Random();
  Future<void> initialize() async {
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings(
            '@mipmap/tawba'); // Replace with your app's icon

    const InitializationSettings initializationSettings =
        InitializationSettings(
      android: initializationSettingsAndroid,
    );

    await flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
    );
  }

  Future<void> showNotification(String? title, String body) async {
    int rndmID = random.nextInt(zekrData.length - 1);
    AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails(
      '$rndmID.0',
      'تطبيق توبه',
      channelDescription: 'تطبيق اذكار وادعية وتلاوة وقراءة القرءان الكريم',
      importance: Importance.high,
      priority: Priority.high,
      timeoutAfter: 45000,
      styleInformation: const BigTextStyleInformation(''),
    );

    NotificationDetails platformChannelSpecifics =
        NotificationDetails(android: androidPlatformChannelSpecifics);

    final uniqueId = DateTime.now().millisecondsSinceEpoch.hashCode;

    await flutterLocalNotificationsPlugin.show(
      uniqueId,
      title,
      body,
      platformChannelSpecifics,
    );
  }

  void scheduleNextNotification() {
    int zekrIndex = random.nextInt(zekrData.length);

    final String randomZekr = zekrData[zekrIndex];
    showNotification(null, randomZekr);

    Future.delayed(notificationInterval, () {
      scheduleNextNotification();
    });
  }
}
