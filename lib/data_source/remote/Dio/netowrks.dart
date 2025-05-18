import 'package:dio/dio.dart';
import 'package:flutter_web_auth_2/flutter_web_auth_2.dart';
import 'package:skility_x/core/config/env_variables.dart';

class DioService {
  static final _dio = Dio();

  static Future<Response> getResponse() async {
    final clientId = EnvVariables.githubClientId;
    final clientSecret = EnvVariables.gitHubSecretKey;
    final redirectUri = EnvVariables.githubCallBackUrl;

    final url =
        'https://github.com/login/oauth/authorize?client_id=$clientId&redirect_uri=$redirectUri&scope=read:user%20user:email';

    final result = await FlutterWebAuth2.authenticate(
      url: url,
      callbackUrlScheme: "SkilityX",
    );

    final code = Uri.parse(result).queryParameters['code'];

    final response = await _dio.post(
      'https://github.com/login/oauth/access_token',
      options: Options(
        headers: {
          'Accept': 'application/json',
        },
      ),
      data: {
        'client_id': clientId,
        'client_secret': clientSecret,
        'code': code,
      },
    );

    return response;
  }

/*
  static Future<String> getGithubAccessToken(String? code) async {
    if (code == null) {
      throw Exception('Authorization code is null');
    }

    final clientId = EnvVariables.githubClientId;
    final clientSecret = EnvVariables.gitHubSecretKey;

    final response =
        await _dio.post('https://github.com/login/oauth/access_token',
            data: {
              'client_id': clientId,
              'client_secret': clientSecret,
              'code': code,
            },
            options: Options(headers: {'Accept': 'application/json'}));

    if (response.data['access_token'] == null) {
      throw Exception('Failed to get access token: ${response.data}');
    }

    return response.data['access_token'];
  }


  // Get GitHub user profile information
  static Future<Map<String, dynamic>> getGithubUserProfile(
      String accessToken) async {
    final response = await _dio.get(
      'https://api.github.com/user',
      options: Options(
        headers: {
          'Authorization': 'token $accessToken',
          'Accept': 'application/json',
        },
      ),
    );

    // Get user emails (especially if user has private email)
    final emailsResponse = await _dio.get(
      'https://api.github.com/user/emails',
      options: Options(
        headers: {
          'Authorization': 'token $accessToken',
          'Accept': 'application/json',
        },
      ),
    );

    // Find primary email
    String? primaryEmail;
    if (emailsResponse.data is List && emailsResponse.data.isNotEmpty) {
      for (final email in emailsResponse.data) {
        if (email['primary'] == true) {
          primaryEmail = email['email'];
          break;
        }
      }
      // If no primary email found, use the first one
      if (primaryEmail == null && emailsResponse.data.isNotEmpty) {
        primaryEmail = emailsResponse.data[0]['email'];
      }
    }

    // Add email to user profile
    final userProfile = response.data;
    if (primaryEmail != null) {
      userProfile['email'] = primaryEmail;
    }

    return userProfile;
  }
  */
}
