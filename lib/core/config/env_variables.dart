import 'package:flutter_dotenv/flutter_dotenv.dart';

class EnvVariables {
  static final String githubClientId = dotenv.env['GITHUB_CLIENT_ID'] ?? "";
  static final String gitHubSecretKey =
      dotenv.env['GITHUB_CLIENT_SECRET'] ?? "";
  static final String githubCallBackUrl =
      dotenv.env['GITHUB_CALLBACK_URL'] ?? "";
  static final String mapsApiKey = dotenv.env['GO_PRO_MAPS_KEY'] ?? "";
}
