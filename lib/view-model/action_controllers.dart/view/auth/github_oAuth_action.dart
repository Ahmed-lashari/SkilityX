import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skility_x/core/config/dep_injection/user_model.dart';
import 'package:skility_x/core/utils.dart/utils.dart';
import 'package:skility_x/core/utils.dart/validators.dart';
import 'package:skility_x/data_source/repository/auth/github_oAuth/github_oauth_repo.dart';
import 'package:skility_x/models/Users/users.dart';

class GitHubOauthAction {
  static Future<void> registerUser(
      BuildContext context, GlobalKey<FormState> formKey, WidgetRef ref) async {
    if (Validators.validateForm(formKey)) {
      Utils.showLoading(context);

      Users user = ref.read(userModelDi);

      if (user.profilePicUrl.isNotEmpty) {
        ref.read(userModelDi.notifier).updateTextDetails(ref);
        // collecting the data first

        // calling register repository
        final (isAuthenticated, isNew) = await GitHubOauthRepo.registerOAuth();

        if (isAuthenticated) {
          if (isNew) {
            user = ref.read(userModelDi);
            // store new datta in the firestore and then navigate
          } else {
            // get latest data from firestore and then navigate
          }
        } else {}
      } else {
        Utils.toastMsg(title: "Please select profile picture as well.");
      }
      Utils.cancelLoading(context);
    }
  }

  static Future<void> loginUser(BuildContext context, WidgetRef ref) async {
    Utils.showLoading(context);

    // calling login repository
    final authenticated = await GitHubOauthRepo.loginOAuth();
    if (authenticated) {
      // make firebase call to get user lates data stored there
    }
    Utils.cancelLoading(context);
  }
}
