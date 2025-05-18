import 'package:flutter/material.dart';
import 'package:skility_x/core/utils.dart/utils.dart';
import 'package:skility_x/data_source/remote/Firebase/firebase_manager.dart';
import 'package:toastification/toastification.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthCommon {
  static Future<bool> logout(BuildContext context) async {
    try {
      Utils.showLoading(context);
      await FirebaseManager.auth.signOut();
      Utils.toastMsg(
          title: 'LogedOut Successfully.', type: ToastificationType.error);

      return true;
    } on FirebaseAuthException catch (e, s) {
      Utils.handleError('Logout failed: ${e.message}', s);
    } catch (e, s) {
      Utils.handleError('Unexpected error during logout: $e', s);
    } finally {
      Utils.cancelLoading(context);
    }
    return false;
  }
}
