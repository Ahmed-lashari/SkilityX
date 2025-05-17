import 'package:firebase_auth/firebase_auth.dart';
import 'package:skility_x/core/utils.dart/utils.dart';
import 'package:skility_x/data_source/remote/Firebase/auth/login_pass/auth_login_pass_service.dart';
import 'package:toastification/toastification.dart';

class AuthLoginPassRepo {
  // create account + handle errors
  static Future<bool> signIn(String email, String password) async {
    try {
      await AuthLoginPassService.registerUser(email.trim(), password.trim());
      return true;
    } on FirebaseAuthException catch (e, s) {
      switch (e.code) {
        case 'email-already-in-use':
          Utils.handleError('Email is already in use.', s);
          Utils.toastMsg(
              title: "Email already in use",
              type: ToastificationType.warning,
              description: "Please use another email address and try again.");
          break;
        case 'invalid-email':
          Utils.handleError('Invalid email address.', s);
          Utils.toastMsg(
              title: "Email does not exist.", type: ToastificationType.warning);
          break;
        case 'operation-not-allowed':
          Utils.handleError('Email/password accounts are not enabled.', s);
          Utils.toastMsg(
              title: "This email has been blocked.",
              type: ToastificationType.warning);
          break;
        case 'weak-password':
          Utils.handleError('Password is too weak.', s);
          Utils.toastMsg(
              title: "Password must be atleast 6 charachters long.",
              type: ToastificationType.warning);
          break;
        default:
          Utils.handleError('Authentication error: ${e.message}', s);
          Utils.toastMsg(
              title: "Internal Error! Please try again later.",
              type: ToastificationType.warning);
      }

      return false;
    } catch (e, s) {
      Utils.handleError('Unexpected error: $e', s);
      Utils.toastMsg(
          title: "Server side error. Please try again later.",
          type: ToastificationType.warning);
      return false;
    }
  }

  static Future<bool> logOut() async {
    try {
      await AuthLoginPassService.logOut();
      return true;
    } on FirebaseAuthException catch (e, s) {
      Utils.handleError('Logout failed: ${e.message}', s);
    } catch (e, s) {
      Utils.handleError('Unexpected error during logout: $e', s);
    }
    return false;
  }

  // create account + handle errors
  static Future<bool> login(String email, String password) async {
    try {
      await AuthLoginPassService.loginuser(email.trim(), password.trim());
      return true;
    } on FirebaseAuthException catch (e, s) {
      final type = ToastificationType.error;
      switch (e.code) {
        case 'user-not-found':
          Utils.handleError('No user found for that email.', s);
          Utils.toastMsg(title: "Email does not exist", type: type);
          break;
        case 'wrong-password':
          Utils.handleError('Incorrect password.', s);
          Utils.toastMsg(title: "Invalid Password!", type: type);
          break;
        case 'invalid-email':
          Utils.handleError('Invalid email format.', s);
          Utils.toastMsg(
              title: "Invalid Email!",
              description: 'Please enter a valid email address.',
              type: type);
          break;
        case 'user-disabled':
          Utils.handleError('This user account has been disabled.', s);
          Utils.toastMsg(
              title: "This user account has been disabled.", type: type);
          break;
        case 'too-many-requests':
          Utils.handleError('Too many login attempts. Try again later.', s);
          Utils.toastMsg(
              title: "Too many login attempts. Try again tomorrow.",
              type: type);
          break;
        default:
          Utils.handleError('Login failed: ${e.message}', s);
          Utils.toastMsg(
              title: "Login failed!",
              description: 'Please check your internet connection.',
              type: type);
      }
      return false;
    } catch (e, s) {
      Utils.handleError('Unexpected error during login: $e', s);
      Utils.toastMsg(
          title: "Uncaught Error!",
          description: e.toString(),
          type: ToastificationType.error);
      return false;
    }
  }
}
