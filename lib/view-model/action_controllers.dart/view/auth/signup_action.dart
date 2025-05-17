import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skility_x/constants/app_keys/text_controller_keys.dart';
import 'package:skility_x/core/config/dep_injection/user_model.dart';
import 'package:skility_x/core/utils.dart/utils.dart';
import 'package:skility_x/core/utils.dart/validators.dart';
import 'package:skility_x/data_source/repository/auth/login_pass/auth_login_pass_repo.dart';
import 'package:skility_x/view-model/data_providers/view/widgets/text_controllers.dart';
import 'package:toastification/toastification.dart';

class SignupAction {
  static registerUser(WidgetRef ref, GlobalKey<FormState> formKey) async {
    if (Validators.validateForm(formKey)) {
      final user = ref.read(userModelDi);
      if (user.profilePicUrl.isNotEmpty) {
        // ref.read(userModelDi.notifier).updateTextDetails(ref);

        final String email =
            ref.read(controllerTextProvider(TextControllerKeys.emailKey));
        final String password =
            ref.read(controllerTextProvider(TextControllerKeys.passwordKey));

        final bool isAuthenticated =
            await AuthLoginPassRepo.signIn(email, password);

        if (isAuthenticated) {
          debugPrint('Your account has been created.');
          Utils.toastMsg(
              title: "Successful.",
              description: "Your account has been created successsfully.",
              type: ToastificationType.success);

          // now save ata in the firestore
        }
        Utils.toastMsg(
            title: "Successful.",
            description: "Your account has been created successsfully.",
            type: ToastificationType.success);
      } else {
        Utils.toastMsg(
            title: "Please select an image as well",
            type: ToastificationType.warning);
      }
    }
  }

  static logout() async {
    final bool isLogedOut = await AuthLoginPassRepo.logOut();
    if (isLogedOut) {
      Utils.toastMsg(
          title: "Loged out successfully.", type: ToastificationType.info);
    } else {
      debugPrint('Logginf Error');
    }
  }
}
