import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skility_x/constants/app_keys/text_controller_keys.dart';
import 'package:skility_x/core/utils.dart/utils.dart';
import 'package:skility_x/core/utils.dart/validators.dart';
import 'package:skility_x/data_source/repository/auth/login_pass/auth_login_pass_repo.dart';
import 'package:skility_x/view-model/data_providers/view/widgets/text_controllers.dart';
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

      final bool isLogedIn = await AuthLoginPassRepo.login(email, password);

      if (isLogedIn) {
        debugPrint('Your account has been created.');
        Utils.toastMsg(
            title: "Successfully Authenticated.",
            type: ToastificationType.success);

        // get the lates data from firestore

        // navigate

        // await AppNavigator.startAsInitial(context, widgetRoute: HomeTabs());

        // now save ata in the firestore
      }
    } else {
      Utils.toastMsg(
          title: "Please fill the credentials.", type: ToastificationType.info);
    }

    Utils.cancelLoading(context);
  }
}
