import 'dart:developer';
import 'package:skility_x/core/config/env_variables.dart';
import 'package:skility_x/data_source/remote/Dio/notification_netowrk.dart';

class SendNotificationService {
  static Future<void> sendNotificationUsingApi({
    required String fcmTokenOfReceiver,
    required Map<String, dynamic>? data,
    required String? title,
    required String? body,
  }) async {
    final serverKey = await EnvVariables.getServerKey();

    if (serverKey.isEmpty) {
      log('Server key is returned null: lib/data_source/remote/Firebase/cloud_messaging/send_notification_service.dart');
      return;
    }
    // final url = EnvVariables.notificationApiUrl;
    // if (url.isEmpty) {
    //   log('url returned null from lib/data_source/remote/Firebase/cloud_messaging/send_notification_service.dart');
    //   return;
    // }

    final Map<String, String> headers = {
      "Content-Type": 'application/json',
      "Authorization": 'Bearer $serverKey',
    };

    final Map<String, dynamic> message = {
      "message": {
        "token": fcmTokenOfReceiver,
        "notification": {"body": body, "title": title},
        "data": data
      }
    };
    await DioNotification.sendNotification(
        url:
            "https://fcm.googleapis.com/v1/projects/skilityx-22a24/messages:send",
        headers: headers,
        message: message);
  }
}
