import 'dart:ui';
import 'package:app_settings/app_settings.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:skility_x/data_source/remote/Firebase/cloud_messaging/notification_service.dart';
import 'package:skility_x/data_source/remote/Firebase/firebase_manager.dart';
import 'package:skility_x/firebase_options.dart';
import 'package:skility_x/models/SkillsOffered/skills_offered.dart';
import 'package:skility_x/models/SkillsRequests/skills_requests.dart';
import 'package:skility_x/models/Users/users.dart';

class InitDependencies {
  static Future<void> initBootstraps() async {
    await _initDotEnv();
    await _initHive();
    await _initFirebase();
    await _initNotifications();
    await _initMsgPermission();
    _initCrashlatics();
  }

  static Future<void> _initDotEnv() async {
    await dotenv.load(fileName: ".env");
  }

  static Future<void> _initHive() async {
    final directory = await getApplicationDocumentsDirectory();
    Hive.init(directory.path);
    Hive.registerAdapter<Users>(UsersAdapter());
    Hive.registerAdapter<SkillsOffered>(SkillsOfferedAdapter());
    Hive.registerAdapter<SkillsRequests>(SkillsRequestsAdapter());
  }

  static Future<void> _initFirebase() async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  }

  static Future<void> _initNotifications() async {
    FirebaseMessaging.onBackgroundMessage(_firebaseBackgroundHandler);

    NotificationService.firebaseCloudInit();
    NotificationService.setupInteractMessage();
  }

  @pragma('vm:entry-point')
  static Future<void> _firebaseBackgroundHandler(RemoteMessage message) async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  }

  static void _initCrashlatics() {
    FlutterError.onError = (errorDetails) {
      FirebaseManager.crashlytics.recordFlutterFatalError(errorDetails);
    };
    PlatformDispatcher.instance.onError = (error, stack) {
      FirebaseManager.crashlytics.recordError(error, stack, fatal: true);
      return true;
    };
  }

  static Future<void> _initMsgPermission() async {
    final settings = await FirebaseManager.cloudMessaging.requestPermission(
        alert: true,
        announcement: true,
        badge: true,
        carPlay: true,
        criticalAlert: true,
        provisional: true,
        sound: true,
        providesAppNotificationSettings: true);

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      debugPrint("Permission authorized");
    } else if (settings.authorizationStatus ==
        AuthorizationStatus.provisional) {
      debugPrint("Permission authorized");
    } else {
      debugPrint('opening app settings for permissions');
      await AppSettings.openAppSettings(type: AppSettingsType.notification);
    }
  }
}
