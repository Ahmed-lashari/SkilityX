import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skility_x/constants/app-icons.dart';
import 'package:skility_x/constants/app_colors.dart';
import 'package:skility_x/constants/app_keys/text_controller_keys.dart';
import 'package:skility_x/core/utils.dart/validators.dart';
import 'package:skility_x/view-model/action_controllers.dart/view/auth/login_action.dart';
import 'package:skility_x/view/widgets/app_textfield.dart';
import 'package:skility_x/view/widgets/custom_widgets.dart';

class LoginUi extends ConsumerStatefulWidget {
  const LoginUi({super.key});

  @override
  ConsumerState<LoginUi> createState() => _LoginUiState();
}

class _LoginUiState extends ConsumerState<LoginUi> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: formKey,
        child: Column(
          spacing: 16,
          children: [
            myTextField(
                prefixIcon: AppStaticIcons.person,
                hintText: "Email",
                validator: Validators.emailValidator,
                controllerKey: TextControllerKeys.emailKey),
            _buildPasswordFiels(),
            CustomWidgets.actionButton(
                label: 'Login',
                onPressed: () => LoginAction.loginUser(context, ref, formKey)),
            //  Validators.validateForm(formKey)
            CustomWidgets.myDivider(text: "Or login with"),
            CustomWidgets.OAuthOptions(),
            const SizedBox.shrink(),
          ],
        ),
      ),
    );
  }

  Widget _buildPasswordFiels() {
    return Column(
      spacing: 0,
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        myTextField(
            prefixIcon: AppStaticIcons.password,
            hintText: "Password",
            validator: Validators.passwordValidation,
            controllerKey: TextControllerKeys.passwordKey),
        TextButton(
            onPressed: () {},
            child: Text('Forgot Password?',
                style: TextStyle(
                  color: AppColors.secondary,
                  fontSize: 12,
                )))
      ],
    );
  }
}
