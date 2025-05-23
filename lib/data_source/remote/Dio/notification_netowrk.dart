import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:skility_x/core/utils.dart/utils.dart';

class DioNotification {
  static final _dio = Dio();
  static Future<void> sendNotification({
    required String url,
    required Map<String, String> headers,
    required Map<String, dynamic> message,
  }) async {
    try {
      final response = await _dio.post(
        url,
        data: message,
        options: Options(headers: headers),
      );

      debugPrint('POST $url → ${response.statusCode}');

      if (response.data != null) {
        if (response.statusCode! >= 200 && response.statusCode! < 300) {
          debugPrint("NOTIFICATION SEND");
        } else {
          debugPrint("NOTIFICATION NOT SEND");
        }
      }
    } on DioException catch (e, s) {
      Utils.handleError(e.toString(), s);
      rethrow;
    } catch (e, h) {
      Utils.handleError(e.toString(), h);
      rethrow;
    }
  }
}
