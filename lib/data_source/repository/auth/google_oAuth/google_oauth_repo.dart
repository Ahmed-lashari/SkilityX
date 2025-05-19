import 'package:flutter/material.dart';
import 'package:skility_x/core/utils.dart/utils.dart';
import 'package:skility_x/data_source/remote/Firebase/auth/oauth/google_auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:skility_x/data_source/repository/auth/common_features.dart';
import 'package:skility_x/data_source/repository/firestore/firestore_user_data_repo.dart';
import 'package:toastification/toastification.dart';

class GoogleOauthRepo {
  static Future<(UserCredential?, bool)> loginOAuth(
      BuildContext context) async {
    try {
      final (cred, isNew) = await GoogleAuthService.signUpWithGoogle();

      if (cred != null) {
        if (isNew) {
          debugPrint("User is new. Logging Out.");
          await AuthCommon.logout(context);
          Utils.toastMsg(
              title: "Account doesnt exist.",
              description:
                  'Please register your account first usign Registeration portal.',
              type: ToastificationType.error);
          return (null, false);
        }
        debugPrint("User already exists.");
        return (cred, true);
      }
      return (null, false);
    } on FirebaseAuthException catch (e, h) {
      Utils.handleError(e.message ?? e.code, h);
      Utils.toastMsg(
        title: "Login Error",
        description: _getFirebaseErrorMessage(e.code),
      );
    } catch (e, h) {
      Utils.handleError(e.toString(), h);
      Utils.toastMsg(
        title: "Unexpected Error",
        description: "Something went wrong. Please try again.",
      );
    }
    return (null, false);
  }

  static Future<(UserCredential?, bool)> registerOAuth(
      BuildContext context) async {
    try {
      final (cred, isNew) = await GoogleAuthService.signUpWithGoogle();

      if (cred != null) {
        if (isNew) {
          debugPrint("User is new. Registration successful.");
          final userData =
              await FirestoreUserDataRepo.getUserDataById(cred.user!.uid);

          if (userData == null) {
            return (cred, true);
          }
        }
        await AuthCommon.logout(context);
        debugPrint("User already exists.");
      }
      return (cred, false);
    } on FirebaseAuthException catch (e, h) {
      Utils.handleError(e.message ?? e.code, h);
      Utils.toastMsg(
        title: "Registration Error",
        description: _getFirebaseErrorMessage(e.code),
      );
    } catch (e, h) {
      Utils.handleError(e.toString(), h);
      Utils.toastMsg(
        title: "Unexpected Error",
        description: "Something went wrong. Please try again.",
      );
    }
    return (null, false);
  }

  static String _getFirebaseErrorMessage(String code) {
    switch (code) {
      case 'account-exists-with-different-credential':
        return "This account exists with a different sign-in method.";
      case 'invalid-credential':
        return "The credential is invalid or expired.";
      case 'user-disabled':
        return "This user has been disabled.";
      case 'user-not-found':
        return "No user found for the provided credential.";
      case 'wrong-password':
        return "Incorrect password.";
      case 'network-request-failed':
        return "Network error. Please check your connection.";
      default:
        return "Authentication failed. Please try again.";
    }
  }
}
