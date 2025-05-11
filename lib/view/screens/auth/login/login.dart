import 'package:flutter/material.dart';
import 'package:skility_x/constants/app-icons.dart';
import 'package:skility_x/constants/app_colors.dart';
import 'package:skility_x/constants/app_keys/text_controller_keys.dart';
import 'package:skility_x/core/utils.dart/validators.dart';
import 'package:skility_x/view/themes/theme_conts/typography.dart';
import 'package:skility_x/view/widgets/app_textfield.dart';
import 'package:skility_x/view/widgets/custom_widgets.dart';

class LoginUi extends StatefulWidget {
  const LoginUi({super.key});

  @override
  State<LoginUi> createState() => _LoginUiState();
}

class _LoginUiState extends State<LoginUi> {
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
                onPressed: () => Validators.validateForm(formKey)),
            CustomWidgets.myDivider(text: "Or login with"),
            CustomWidgets.OAuthOptions()
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
                    fontFamily: AppTypography.interRegular)))
      ],
    );
  }
}
