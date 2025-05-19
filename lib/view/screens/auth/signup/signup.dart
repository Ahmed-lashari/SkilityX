import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skility_x/constants/app-icons.dart';
import 'package:skility_x/constants/app_colors.dart';
import 'package:skility_x/constants/app_keys/drop_down_keys.dart';
import 'package:skility_x/constants/app_keys/image_keys.dart';
import 'package:skility_x/constants/app_keys/text_controller_keys.dart';
import 'package:skility_x/core/config/dep_injection/user_model.dart';
import 'package:skility_x/core/config/route_config.dart';
import 'package:skility_x/core/utils.dart/validators.dart';
import 'package:skility_x/data_source/remote/Firebase/firebase_manager.dart';
import 'package:skility_x/data_source/repository/auth/common_features.dart';
// import 'package:skility_x/data_source/repository/auth/common_features.dart';
import 'package:skility_x/view-model/action_controllers.dart/view/screens/auth/github_oAuth_action.dart';
import 'package:skility_x/view-model/action_controllers.dart/view/screens/auth/google_oAuth_action.dart';
import 'package:skility_x/view-model/action_controllers.dart/view/screens/auth/signup_action.dart';
import 'package:skility_x/view/screens/auth/select_profile_pic.dart';
import 'package:skility_x/view/widgets/app_drop_down.dart';
import 'package:skility_x/view/widgets/app_textfield.dart';
import 'package:skility_x/view/widgets/custom_widgets.dart';
import 'package:skility_x/view/widgets/image_ui.dart';

class SignUpUi extends ConsumerStatefulWidget {
  const SignUpUi({super.key});

  @override
  ConsumerState<SignUpUi> createState() => _SignUpUiState();
}

class _SignUpUiState extends ConsumerState<SignUpUi> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    if (FirebaseManager.user != null) {
      debugPrint(
          'User is authenticated: wiht email ${FirebaseManager.user?.email}');
    } else {
      debugPrint("User is not authenticated");
    }
    return SingleChildScrollView(
      child: Form(
        key: formKey,
        child: Column(
          spacing: 16,
          children: [
            const SizedBox.shrink(),
            _buildImageAndName(),
            myDropDwon(
                hintText: "Gender",
                prefixIcon: AppStaticIcons.gender,
                nextFocusKey: DropDownKeys.searchSkills,
                dropdwonKey: DropDownKeys.genders),
            myDropDwon(
                hintText: "Main Skill",
                prefixIcon: AppStaticIcons.skills,
                nextFocusKey: TextControllerKeys.emailKey,
                dropdwonKey: DropDownKeys.searchSkills),
            myTextField(
                prefixIcon: AppStaticIcons.email,
                hintText: "Email",
                nextFocusKey: TextControllerKeys.passwordKey,
                validator: Validators.emailValidator,
                controllerKey: TextControllerKeys.emailKey),
            myTextField(
                prefixIcon: AppStaticIcons.password,
                hintText: "Password",
                validator: Validators.passwordValidation,
                controllerKey: TextControllerKeys.passwordKey),
            CustomWidgets.actionButton(
                label: 'Register',
                onPressed: () =>
                    SignupAction.registerUser(context, ref, formKey)),
            CustomWidgets.actionButton(
                label: 'Logout Instantly',
                onPressed: () => AuthCommon.logout(context)),
            CustomWidgets.myDivider(text: "Or register using"),
            CustomWidgets.OAuthOptions(
              formKey: formKey,
              GoogleOnTap: () =>
                  GoogleOauthAction.registerUser(context, formKey, ref),
              GithubOnTap: () =>
                  GitHubOauthAction.registerUser(context, formKey, ref),
            ),
            const SizedBox.shrink(),
          ],
        ),
      ),
    );
  }

  Widget _buildImageAndName() {
    return Row(
      spacing: 10,
      children: [
        Expanded(
          child: myTextField(
            prefixIcon: AppStaticIcons.person,
            hintText: "Name",
            controllerKey: TextControllerKeys.nameKey,
            nextFocusKey: DropDownKeys.genders,
          ),
        ),
        Container(
            padding: const EdgeInsets.all(2),
            decoration: BoxDecoration(
                color: AppColors.background, shape: BoxShape.circle),
            child: GestureDetector(
                onTap: () => AppNavigator.navigateTo(context,
                    wRoute: ProfilePhotoSetting()),
                child: Consumer(builder: (context, ref, child) {
                  final userDi = ref.watch(userModelDi);
                  return ProfilePicture(
                      url: userDi.profilePicUrl.isEmpty
                          ? AvatarKeys.uwuChan
                          : userDi.profilePicUrl);
                }))),
      ],
    );
  }
}
