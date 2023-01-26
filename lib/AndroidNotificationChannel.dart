import 'dart:convert';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'main.dart';

class NotificationService{
  //Singleton pattern
  static final NotificationService _notificationService =
  NotificationService._internal();
  factory NotificationService() {
    return _notificationService;
  }
  NotificationService._internal();

  //instance of FlutterLocalNotificationsPlugin
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
  FlutterLocalNotificationsPlugin();

  Future<void> init() async {
    //Initialization Settings for Android
    final AndroidInitializationSettings initializationSettingsAndroid =
    const AndroidInitializationSettings('ic_launcher');

    //InitializationSettings for initializing settings for both platforms (Android & iOS)
    final InitializationSettings initializationSettings =
    InitializationSettings(
      android: initializationSettingsAndroid,
    );

    await flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: onDidReceiveNotificationResponse,
    );
  }

  void onDidReceiveNotificationResponse(
      NotificationResponse notificationResponse) async {
    final String? payload = notificationResponse.payload;
    print('onDidReceiveNotificationResponse $payload');
    // convert payload to RemoteMessage
    final RemoteMessage message = RemoteMessage(data: jsonDecode(payload!));
    debugPrint('notification payload: ${message.data}');

    // if (message.data["type"] == "developer") {
    //   Navigator.pushNamed(
    //       NavigationService.navigatorKey.currentContext!, '/mloffers',
    //       arguments: message);
    // } else
    if (message.data["type"] == "clinic") {
      Navigator.pushNamed(
          NavigationService.navigatorKey.currentContext!, '/clinic_appointments', arguments: message);
    }else if (message.data["type"] == "petOwner") {
      Navigator.pushNamed(
          NavigationService.navigatorKey.currentContext!, '/petOwner_appointments' , arguments: message);
    }
  }
  Future<void> showNotification(
      {required RemoteNotification notification,
        AndroidNotification? android,
        required RemoteMessage data}) async {
    // convert data to string
    final String dataString = jsonEncode(data.data);
    flutterLocalNotificationsPlugin.show(
        notification.hashCode,
        notification.title,
        notification.body,
        NotificationDetails(
          android: AndroidNotificationDetails(
            channel.id,
            channel.name,
            priority: Priority.high,
            importance: Importance.high,
            icon: android?.smallIcon,
          ),
        ),
        //
        payload: dataString
    );
  }

}