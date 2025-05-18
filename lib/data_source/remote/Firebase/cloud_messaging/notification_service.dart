import 'package:skility_x/data_source/remote/Firebase/firebase_manager.dart';

class NotificationService {
  static Future<String?> getFcmToken() async {
    final fcmToken = await FirebaseManager.cloudMessaging.getToken();
    return fcmToken;
  }
}
