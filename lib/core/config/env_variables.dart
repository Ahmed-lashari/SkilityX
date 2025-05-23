import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:googleapis_auth/auth_io.dart';

class EnvVariables {
  static final String githubClientId = dotenv.env['GITHUB_CLIENT_ID'] ?? "";
  static final String gitHubSecretKey =
      dotenv.env['GITHUB_CLIENT_SECRET'] ?? "";
  static final String githubCallBackUrl =
      dotenv.env['GITHUB_CALLBACK_URL'] ?? "";
  static final String mapsApiKey = dotenv.env['GO_PRO_MAPS_KEY'] ?? "";

  // messaging private key in json format converted to string
  static Future<String> getServerKey() async {
    String getServerKey = await _GetServerKey.getServerKey() ?? '';

    return getServerKey;
  }

  static final String notificationApiUrl =
      dotenv.env['NOTIFICATION_API_URL'] ?? "";
}

class _GetServerKey {
  static Future<String?> getServerKey() async {
    final path = dotenv.env['MESSAGING_SDK_KEY_PATH'];
    if (path != null) {
      debugPrint(path);
      try {
        // Read asset using rootBundle
        final fileContent = await rootBundle.loadString(path);

        // decoding the .json file and generating server key
        final serverKey = await _generateServerTokenKey(fileContent);

        debugPrint(serverKey);
        return serverKey;
      } catch (e) {
        debugPrint("Error reading asset: $e");
      }
    } else {
      log("\n\nPATH FROM DOT ENV IS RETURNED NULL\n\n");
    }
    return null;
  }

  static Future<String> _generateServerTokenKey(String key) async {
    List<String> scope = [
      'https://www.googleapis.com/auth/userinfo.email',
      'https://www.googleapis.com/auth/firebase.database',
      'https://www.googleapis.com/auth/firebase.messaging',
    ];
    final credentials = ServiceAccountCredentials.fromJson(jsonDecode(key));
    final client = await clientViaServiceAccount(credentials, scope);
    final accessToken = client.credentials.accessToken.data;
    return accessToken;
  }
}
