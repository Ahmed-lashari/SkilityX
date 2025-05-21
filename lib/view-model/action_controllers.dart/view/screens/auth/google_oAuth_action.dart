import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skility_x/core/config/dep_injection/user_model.dart';
import 'package:skility_x/core/config/route_config.dart';
import 'package:skility_x/core/utils.dart/utils.dart';
import 'package:skility_x/core/utils.dart/validators.dart';
import 'package:skility_x/data_source/repository/auth/google_oAuth/google_oauth_repo.dart';
import 'package:skility_x/data_source/repository/firestore/firestore_user_data_repo.dart';
import 'package:skility_x/data_source/repository/hive/hive_user_data_repo.dart';
import 'package:skility_x/models/Users/users.dart';
import 'package:skility_x/view/screens/home/bottom_tabs.dart';

class GoogleOauthAction {
  static Future<void> registerUser(
      BuildContext context, GlobalKey<FormState> formKey, WidgetRef ref) async {
    if (Validators.validateForm(formKey)) {
      Utils.showLoading(context);

      Users user = ref.read(userModelDi);

      if (user.profilePicUrl.isNotEmpty) {
        ref.read(userModelDi.notifier).updateTextDetails(ref);
        // collecting the data first

        // calling register repository
        final (cred, isAuthenticatedAndNew) =
            await GoogleOauthRepo.registerOAuth(context);

        if (isAuthenticatedAndNew && cred != null) {
          // make a firestore call for savig user datat into dattaabse
          user = ref.read(userModelDi);
          final userWithId =
              await FirestoreUserDataRepo.saveUserData(user, cred.user!.uid);

          if (userWithId == null) {
            debugPrint("USER DID NOT SAVED IN THE FIRESTROE. DEBUG ERROR");
            return;
          }

          // make a hive call for saving user into cache
          final isSaved = await HiveuserDataRepo.saveUserData(userWithId, ref);
          if (isSaved) {
            await AppNavigator.navigateTo(context,
                wRoute: HomeTabs(user: userWithId));
            Utils.cancelLoading(context);
          } else {
            debugPrint("FALSE RETURNED WHILE SAVING USER DATA IN THE HIVE.");
          }
        } else {
          Utils.toastMsg(
              title: 'Account already exists.',
              description: 'Login to access you account');
        }
      } else {
        Utils.toastMsg(title: "Please select profile picture as well.");
      }
      Utils.cancelLoading(context);
    }
  }

  static Future<void> loginUser(BuildContext context, WidgetRef ref) async {
    Utils.showLoading(context);

    // calling login repository
    final (cred, isAuthenticated) = await GoogleOauthRepo.loginOAuth(context);

    if (isAuthenticated && cred != null) {
      // get daat from firebase
      final firebaseData =
          await FirestoreUserDataRepo.getUserDataById(cred.user!.uid);

      // cache in local hive
      if (firebaseData != null) {
        await HiveuserDataRepo.saveUserData(firebaseData, ref);
        // naviagate to home
        await AppNavigator.navigateTo(context,
            wRoute: HomeTabs(user: firebaseData));
      } else {
        debugPrint(
            "NOTINGH TO CACHE IN HIVE COZ NULL RETURNED FROM THE FIREBASE COLL WHILE LOGGIN IN");
      }
    }

    Utils.cancelLoading(context);
  }
}
