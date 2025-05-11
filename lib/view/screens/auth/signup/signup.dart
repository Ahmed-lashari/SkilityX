import 'package:flutter/material.dart';
import 'package:skility_x/constants/app-icons.dart';
import 'package:skility_x/constants/app_keys/text_controller_keys.dart';
import 'package:skility_x/core/utils.dart/validators.dart';
import 'package:skility_x/view/widgets/app_textfield.dart';
import 'package:skility_x/view/widgets/custom_widgets.dart';

class SignUpUi extends StatefulWidget {
  const SignUpUi({super.key});

  @override
  State<SignUpUi> createState() => _SignUpUiState();
}

class _SignUpUiState extends State<SignUpUi> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: formKey,
        child: Column(
          spacing: 16,
          children: [
            const SizedBox.shrink(),
            myTextField(
                prefixIcon: AppStaticIcons.person,
                hintText: "Name",
                controllerKey: TextControllerKeys.nameKey),
            myTextField(
                prefixIcon: AppStaticIcons.email,
                hintText: "Email",
                validator: Validators.emailValidator,
                controllerKey: TextControllerKeys.emailKey),
            myTextField(
                prefixIcon: AppStaticIcons.password,
                hintText: "Password",
                validator: Validators.passwordValidation,
                controllerKey: TextControllerKeys.passwordKey),
            CustomWidgets.actionButton(
                label: 'Register',
                onPressed: () => Validators.validateForm(formKey)),
            CustomWidgets.myDivider(text: "Or register using"),
            CustomWidgets.OAuthOptions(),
            const SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}
