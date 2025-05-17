// Initialize dependencies here

import 'dart:ui';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:skility_x/firebase_options.dart';
import 'package:skility_x/models/SkillsOffered/skills_offered.dart';
import 'package:skility_x/models/SkillsRequests/skills_requests.dart';
import 'package:skility_x/models/Users/users.dart';

class InitDependencies {
  static Future<void> initBootstraps() async {
    await _initDotEnv();
    await _initHive();
    await _initFirebase();
    _initCrashlatics();
  }

  static Future<void> _initDotEnv() async {
    await dotenv.load(fileName: ".env");
  }

  static Future<void> _initHive() async {
    final directory = await getApplicationDocumentsDirectory();
    Hive.init(directory.path);
    Hive.registerAdapter(UsersAdapter());
    Hive.registerAdapter(SkillsOfferedAdapter());
    Hive.registerAdapter(SkillsRequestsAdapter());
  }

  static Future<void> _initFirebase() async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  }

  static void _initCrashlatics() {
    FlutterError.onError = (errorDetails) {
      FirebaseCrashlytics.instance.recordFlutterFatalError(errorDetails);
    };
    PlatformDispatcher.instance.onError = (error, stack) {
      FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
      return true;
    };
  }
}
