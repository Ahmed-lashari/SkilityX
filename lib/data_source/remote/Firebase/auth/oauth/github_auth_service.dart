import 'dart:convert';
import 'package:skility_x/data_source/remote/Dio/netowrks.dart';
import 'package:skility_x/data_source/remote/Firebase/firebase_manager.dart';
import 'package:firebase_auth/firebase_auth.dart';

class GithubAuthService {
  // login existing user
  static Future<UserCredential?> signInWithGitHub() async {
    // getting GitHub auth response
    final response = await DioService.getResponse();
    final accessToken = jsonDecode(response.data)['access_token'];

    // creating Firebase credential from GitHub token
    final AuthCredential credential =
        GithubAuthProvider.credential(accessToken);

    // Sign in to Firebase with the credential
    return await FirebaseManager.auth.signInWithCredential(credential);
  }

  // authenticating new users
  static Future<(UserCredential?, bool)> signUpWithGitHub() async {
    // getting GitHub authentication response
    final response = await DioService.getResponse();
    final accessToken = jsonDecode(response.data)['access_token'];

    // get user profile information from GitHub
    // final userProfile = await DioService.getGithubUserProfile(accessToken);

    // Create Firebase credential from GitHub token
    final AuthCredential credential =
        GithubAuthProvider.credential(accessToken);

    // signing in to Firebase with the local cred
    // firebase automatically creates an account if it not exist
    final userCredential =
        await FirebaseManager.auth.signInWithCredential(credential);

    // If this is a new user, store additional user information in Firebase
    if (userCredential.additionalUserInfo?.isNewUser == true) {
      // store user datat in the firebase (seperate call for thta, no tight coupling)
      return (userCredential, true);
    }
    return (null, false);
  }
}
