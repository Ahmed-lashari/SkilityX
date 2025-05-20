import 'package:firebase_auth/firebase_auth.dart';
import 'package:skility_x/data_source/remote/Firebase/firebase_manager.dart';

class AuthLoginPassService {
  static Future<UserCredential?> registerUser(
      String email, String password) async {
    return await FirebaseManager.auth
        .createUserWithEmailAndPassword(email: email, password: password);
  }

  static Future<UserCredential?> loginuser(
      String email, String password) async {
    return await FirebaseManager.auth
        .signInWithEmailAndPassword(email: email, password: password);
  }

  static forgotPassword() {}
}
