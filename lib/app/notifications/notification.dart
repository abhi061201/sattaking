import 'dart:developer';
import 'dart:io';
import 'dart:math';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';

class NotificationServices extends GetxController {
  FirebaseMessaging messaging = FirebaseMessaging.instance;
  final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  void initlocalNotification(
      BuildContext context, RemoteMessage message) async {
    var androidInitilisationSetting =
        AndroidInitializationSettings('@mipmap/ic_launcher');
    var iosInitialisationSetting = DarwinInitializationSettings();

    var initialisationSetting = InitializationSettings(
      android: androidInitilisationSetting,
      iOS: iosInitialisationSetting,
    );

    await _flutterLocalNotificationsPlugin.initialize(initialisationSetting,
        onDidReceiveNotificationResponse: (payload) {});
  }

  void firebaseInit() {
    if (kDebugMode) {
      FirebaseMessaging.onMessage.listen(
        (messageFromFirebase) {
          if (Platform.isAndroid) {
           
            print('${messageFromFirebase.notification!.title.toString()}');
            print('${messageFromFirebase.notification!.body.toString()}');

            shownotification(messageFromFirebase);
          }
        },
      );
    }
  }

  Future<void> shownotification(RemoteMessage message) async {
    AndroidNotificationChannel channel = AndroidNotificationChannel(
      Random.secure().nextInt(100000).toString(),
      'High Importance notification',
      importance: Importance.max,
    );
     
    AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails(
      channel.id.toString(),
      channel.name.toString(),
      channelDescription: 'Your channel description',
      importance: Importance.high,
      priority: Priority.high,
      ticker: 'ticker',
    );

    const DarwinNotificationDetails iosNotificationDetails =
        DarwinNotificationDetails(
      presentAlert: true,
      presentBadge: true,
      presentBanner: true,
    );

    NotificationDetails notificationDetails = NotificationDetails(
      android: androidNotificationDetails,
      iOS: iosNotificationDetails,
    );
     
    Future.delayed(Duration.zero, () {
      _flutterLocalNotificationsPlugin.show(
        0,
        message.notification!.title.toString(),
        message.notification!.body.toString(),
        notificationDetails,
      );
    });
     print('Hii1');
  }

  void requestNotificationPermission() async {
    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      announcement: true,
      badge: true,
      carPlay: true,
      criticalAlert: true,
      provisional: true,
      sound: true,
    );

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      print('User Permission authorised');
    } else if (settings.authorizationStatus ==
        AuthorizationStatus.provisional) {
      print('User Permission Provisional');
    } else {
      print('User Permission Denied');
    }
  }

  Future<String> getDeviceToken() async {
    // cloud messaging will be done only by this token
    String? deviceToken = await messaging.getToken();
    return deviceToken!;
  }

  void isTokenRefreshed() {
    messaging.onTokenRefresh.listen((event) {
      print('Token Refreshed');
    });
  }
}
