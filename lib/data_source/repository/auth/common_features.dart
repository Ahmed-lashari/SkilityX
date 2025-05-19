import 'package:flutter/material.dart';
import 'package:skility_x/core/config/route_config.dart';
import 'package:skility_x/core/utils.dart/utils.dart';
import 'package:skility_x/data_source/remote/Firebase/firebase_manager.dart';
import 'package:skility_x/data_source/repository/firestore/firestore_user_data_repo.dart';
import 'package:skility_x/data_source/repository/hive/hive_user_data_repo.dart';
import 'package:skility_x/view/screens/auth/auth_screen.dart';
import 'package:skility_x/view/screens/home/bottom_tabs.dart';
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

  static Future<void> checkAuth(BuildContext context) async {
    await Future.delayed(const Duration(seconds: 1), () async {
      Widget nextScreen;

      if (FirebaseManager.user?.uid == null) {
        nextScreen = AuthScreen();
      } else {
        final firebaseData = await FirestoreUserDataRepo.getUserDataById(
            FirebaseManager.user!.uid);

        if (firebaseData != null) {
          await HiveuserDataRepo.saveUserData(firebaseData);
          nextScreen = HomeTabs(user: firebaseData);
        } else {
          Utils.toastMsg(
              title: 'User data not found.', type: ToastificationType.error);
          await AuthCommon.logout(context);
          nextScreen = AuthScreen();
        }
      }

      await AppNavigator.startAsInitial(context, widgetRoute: nextScreen);
    });
  }
}
