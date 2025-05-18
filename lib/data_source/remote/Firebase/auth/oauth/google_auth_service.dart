import 'package:flutter/foundation.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:skility_x/data_source/remote/Firebase/firebase_manager.dart';

class GoogleAuthService {
  static final GoogleSignIn _googleSignIn = GoogleSignIn();
  static final FirebaseAuth _auth = FirebaseManager.auth;

  static Future<UserCredential?> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();

    if (googleUser == null) return null; // user cancells the login

    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    return await _auth.signInWithCredential(credential);
  }

  // first time signin
  static Future<(UserCredential?, bool)> signUpWithGoogle() async {
    final userCredential = await signInWithGoogle();

    if (userCredential != null) {
      final isNewUser = userCredential.additionalUserInfo?.isNewUser ?? false;

      if (isNewUser) {
        debugPrint(
            "User is Newly Authenticated: ${userCredential.user?.email}");
        return (userCredential, true);
      } else {
        debugPrint("User already exists: ${userCredential.user?.email}");
        return (userCredential, false);
      }
    }

    return (null, false);
  }
}
