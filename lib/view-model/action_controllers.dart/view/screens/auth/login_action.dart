import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skility_x/constants/app_keys/text_controller_keys.dart';
import 'package:skility_x/core/config/route_config.dart';
import 'package:skility_x/core/utils.dart/utils.dart';
import 'package:skility_x/core/utils.dart/validators.dart';
import 'package:skility_x/data_source/repository/auth/login_pass/auth_login_pass_repo.dart';
import 'package:skility_x/data_source/repository/firestore/firestore_user_data_repo.dart';
import 'package:skility_x/data_source/repository/hive/hive_user_data_repo.dart';
import 'package:skility_x/view-model/data_providers/view/widgets/text_controllers.dart';
import 'package:skility_x/view/screens/home/bottom_tabs.dart';
import 'package:toastification/toastification.dart';

class LoginAction {
  static loginUser(
      BuildContext context, WidgetRef ref, GlobalKey<FormState> formKey) async {
    if (Validators.validateForm(formKey)) {
      Utils.showLoading(context);
      final String email =
          ref.read(controllerTextProvider(TextControllerKeys.emailKey));
      final String password =
          ref.read(controllerTextProvider(TextControllerKeys.passwordKey));

      final (cred, isLogedIn) = await AuthLoginPassRepo.login(email, password);

      if (isLogedIn && cred != null) {
        debugPrint('Your account has been created.');
        Utils.toastMsg(
            title: "Successfully Authenticated.",
            type: ToastificationType.success);

        // get the lates data from firestore
        final data =
            await FirestoreUserDataRepo.getUserDataById(cred.user!.uid);

        // cache in hive
        if (data != null) {
          final isCached = await HiveuserDataRepo.saveUserData(data, ref);
          if (isCached) {
            Utils.cancelLoading(context);
            await AppNavigator.startAsInitial(context,
                widgetRoute: HomeTabs(user: data));
          }
        }
      }
    } else {
      Utils.toastMsg(
          title: "Please fill the credentials.", type: ToastificationType.info);
    }

    Utils.cancelLoading(context);
  }
}
