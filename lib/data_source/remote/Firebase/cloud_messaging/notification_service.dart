import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:skility_x/data_source/remote/Firebase/firebase_manager.dart';

class NotificationService {
  static FlutterLocalNotificationsPlugin _notificationsPlugin =
      FlutterLocalNotificationsPlugin();

  static Future<String?> getFcmToken() async {
    final fcmToken = await FirebaseManager.cloudMessaging.getToken();
    return fcmToken;
  }

// initilizing platofrms notification
  static Future<void> _initNotificationPlatform(RemoteMessage msg) async {
    final androidSett = const AndroidInitializationSettings("ic_notification");
    final iosSett = const DarwinInitializationSettings();

    final initNotifSett =
        InitializationSettings(android: androidSett, iOS: iosSett);

    await _notificationsPlugin.initialize(
      initNotifSett,
      onDidReceiveNotificationResponse: (response) {},
      onDidReceiveBackgroundNotificationResponse: (response) {},
    );
  }

  // firebase initilization finishing
  static Future<void> firebaseCloudInit() async {
    /// listen messages
    FirebaseMessaging.onMessage.listen((message) {
      RemoteNotification? notifi = message.notification;
      // AndroidNotification? android = message.notification?.android;

      if (kDebugMode) {
        debugPrint("NOTIFICATION TITLE: ${notifi?.title}");
        debugPrint("NOTIFICATION BODY: ${notifi?.body}");
      }

      // ios
      if (Platform.isIOS) {
        _iosForegrounfMessage();
      }

      if (Platform.isAndroid) {
        _initNotificationPlatform(message);
        _showNotificationPopup(message);
      }
    });
  }

// ios display settings
  static Future<void> _iosForegrounfMessage() async {
    await FirebaseManager.cloudMessaging
        .setForegroundNotificationPresentationOptions(
            alert: true, badge: true, sound: true);
  }

  /// multiple states
  static Future<void> setupInteractMessage() async {
    // bg
    FirebaseMessaging.onMessageOpenedApp
        .listen((message) async => await _stateHandler(message));
    // termination
    await FirebaseManager.cloudMessaging
        .getInitialMessage()
        .then((message) async {
      if (message != null && message.data.isNotEmpty) {
        await _stateHandler(message);
      }
    });
  }

  static Future<void> _stateHandler(RemoteMessage msg) async {}

  // shot notification popup
  static Future<void> _showNotificationPopup(RemoteMessage message) async {
    // final id = message.notification!.android!;
    // AndroidNotificationChannel channel = AndroidNotificationChannel(
    //     id.channelId.toString(), id.channelId.toString(),
    //     importance: Importance.high, playSound: true, showBadge: true);

    const channel = AndroidNotificationChannel(
      'high_importance_channel',
      'High Importance Notifications',
      description: 'This channel is used for important notifications.',
      importance: Importance.high,
      playSound: true,
      showBadge: true,
    );

    await _notificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);

// android popup
    final AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails(
      channel.id,
      channel.name,
      channelDescription: "Channel Description",
      importance: Importance.high,
      priority: Priority.high,
      playSound: true,
      sound: channel.sound,
      icon: 'ic_notification',
    );

    // ios poppup
    final DarwinNotificationDetails darwinNotificationDetails =
        DarwinNotificationDetails(
            presentAlert: true,
            presentBadge: true,
            presentBanner: true,
            presentSound: true);

    // merging both popups as per need
    NotificationDetails notificationDetails = NotificationDetails(
        android: androidNotificationDetails, iOS: darwinNotificationDetails);

    // show notification
    Future.delayed(Duration.zero, () {
      _notificationsPlugin.show(0, message.notification?.title,
          message.notification?.body, notificationDetails,
          payload: "Notification Payload");
    });
  }
}
