// Initialize dependencies here

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:skility_x/firebase_options.dart';

class InitDependencies {
  static Future<void> initDotEnv() async {
    // await dotenv.load(fileName: ".env");
  }

  static Future<void> initFirebase() async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  }
}
