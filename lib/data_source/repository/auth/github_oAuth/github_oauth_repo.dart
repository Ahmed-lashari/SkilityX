import 'package:flutter/foundation.dart';
import 'package:skility_x/core/utils.dart/utils.dart';
import 'package:skility_x/data_source/remote/Firebase/auth/oauth/github_auth_service.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class GitHubOauthRepo {
  static Future<bool> loginOAuth() async {
    try {
      final data = await GithubAuthService.signInWithGitHub();

      if (data != null) {
        // successful login
        return true;
      }

      Utils.toastMsg(
        title: "Login Cancelled",
        description: "GitHub login was cancelled. Please try again.",
      );
      return false;
    } on FirebaseAuthException catch (e, h) {
      debugPrint("FirebaseAuthException: ${e.code} - ${e.message}");
      Utils.handleError(e.toString(), h);
      Utils.toastMsg(
        title: "Authentication Error",
        description: _firebaseErrorMessage(e),
      );
      return false;
    } on Exception catch (e, h) {
      debugPrint("Exception in loginOAuth: $e");
      Utils.handleError(e.toString(), h);
      Utils.toastMsg(
        title: "Login Failed",
        description: "Something went wrong during login. Please try again.",
      );
      return false;
    }
  }

// <bool, bool>  ==  <authentication completed, is New user>
  static Future<(bool, bool)> registerOAuth() async {
    try {
      final (cred, isNew) = await GithubAuthService.signUpWithGitHub();

      if (cred != null) {
        if (isNew) {
          debugPrint("New GitHub user signed up.");
          return (true, true);
        } else {
          Utils.toastMsg(
            title: "Already Registered",
            description: "You already have an account. Please login instead.",
          );
          return (false, true);
        }
      } else {
        Utils.toastMsg(
          title: "Signup Failed",
          description: "Could not sign up using GitHub. Try again.",
        );
      }

      return (false, false);
    } on FirebaseAuthException catch (e, h) {
      debugPrint("FirebaseAuthException: ${e.code} - ${e.message}");
      Utils.handleError(e.toString(), h);
      Utils.toastMsg(
        title: "Authentication Error",
        description: _firebaseErrorMessage(e),
      );
    } on Exception catch (e, h) {
      debugPrint("Exception in registerOAuth: $e");
      Utils.handleError(e.toString(), h);
      Utils.toastMsg(
        title: "Signup Failed",
        description: "Something went wrong during sign up. Please try again.",
      );
    }
    return (false, false);
  }

  static String _firebaseErrorMessage(FirebaseAuthException e) {
    switch (e.code) {
      case 'network-request-failed':
        return "Check your internet connection and try again.";
      case 'popup-blocked':
        return "Please allow popups for this site.";
      case 'user-disabled':
        return "This user has been disabled.";
      case 'account-exists-with-different-credential':
        return "An account already exists with a different sign-in method.";
      case 'invalid-credential':
        return "Invalid credentials provided. Try again.";
      default:
        return "Authentication failed. Please try again.";
    }
  }
}
