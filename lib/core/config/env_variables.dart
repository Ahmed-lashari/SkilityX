import 'package:flutter_dotenv/flutter_dotenv.dart';

class EnvVariables {
  static final String githubClientId = dotenv.env['GITHUB_CLIENT_ID'] ?? "";
  static final String gitHubSecretKey =
      dotenv.env['GITHUB_CLIENT_SECRET'] ?? "";
}
