import 'package:skility_x/core/utils.dart/utils.dart';
import 'package:skility_x/data_source/remote/Firebase/cloud_messaging/notification_service.dart';

class NotificationRepo {
  static Future<String?> getFcmToken() async {
    try {
      return await NotificationService.getFcmToken();
    } catch (e, h) {
      Utils.handleError('Error getting FCM token: $e', h);
      return null;
    }
  }
}
