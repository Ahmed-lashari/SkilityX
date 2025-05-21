import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skility_x/constants/app_keys/text_controller_keys.dart';
import 'package:skility_x/core/config/dep_injection/user_model.dart';
import 'package:skility_x/core/config/route_config.dart';
import 'package:skility_x/core/utils.dart/utils.dart';
import 'package:skility_x/core/utils.dart/validators.dart';
import 'package:skility_x/data_source/repository/auth/login_pass/auth_login_pass_repo.dart';
import 'package:skility_x/data_source/repository/firestore/firestore_user_data_repo.dart';
import 'package:skility_x/data_source/repository/hive/hive_user_data_repo.dart';
import 'package:skility_x/models/Users/users.dart';
import 'package:skility_x/view-model/data_providers/view/widgets/text_controllers.dart';
import 'package:skility_x/view/screens/home/bottom_tabs.dart';
import 'package:toastification/toastification.dart';

class SignupAction {
  static registerUser(
      BuildContext context, WidgetRef ref, GlobalKey<FormState> formKey) async {
    if (Validators.validateForm(formKey)) {
      Utils.showLoading(context);
      Users user = ref.read(userModelDi);
      if (user.profilePicUrl.isNotEmpty) {
        // ref.read(userModelDi.notifier).updateTextDetails(ref);

        final String email =
            ref.read(controllerTextProvider(TextControllerKeys.emailKey));
        final String password =
            ref.read(controllerTextProvider(TextControllerKeys.passwordKey));

        final (cred, isAuthenticated) =
            await AuthLoginPassRepo.signIn(email, password);

        if (isAuthenticated && cred != null) {
          debugPrint('Your account has been created.');

          // now save ata in the firestore
          user = ref.read(userModelDi);
          debugPrint(user.email);
          debugPrint(user.name);
          debugPrint(user.mainSkill);
          debugPrint(user.profilePicUrl);

          final userWithId =
              await FirestoreUserDataRepo.saveUserData(user, cred.user!.uid);
          Utils.toastMsg(
              title: "Successful.",
              description: "Your account has been created successsfully.",
              type: ToastificationType.success);

          // make a hive call for saving user into cache as well
          if (userWithId == null) {
            throw "UserWithId returned null";
          }
          final isSaved = await HiveuserDataRepo.saveUserData(userWithId, ref);
          if (isSaved) {
            await AppNavigator.navigateTo(context,
                wRoute: HomeTabs(user: userWithId));
            Utils.cancelLoading(context);
          } else {
            debugPrint("FALSE RETURNED WHILE SAVING USER DATA IN THE HIVE.");
          }
        }
        Utils.toastMsg(
            title: "Failed",
            description: "Your account has not been created.",
            type: ToastificationType.success);
      } else {
        Utils.toastMsg(
            title: "Please select an image as well",
            type: ToastificationType.warning);
      }
      Utils.cancelLoading(context);
    }
  }
}
