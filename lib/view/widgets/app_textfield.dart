import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skility_x/constants/app_colors.dart';
import 'package:skility_x/core/utils.dart/validators.dart';
import 'package:skility_x/view-model/data_providers/view/widgets/focus_nodes.dart';
import 'package:skility_x/view-model/data_providers/view/widgets/text_controllers.dart';

class myTextField extends ConsumerWidget {
  final String hintText;
  final IconData? prefixIcon;
  final String controllerKey;
  final String? nextFocusKey;
  final TextInputType keyboardType;
  final bool obscureText;
  final String? Function(String?)? validator;

  const myTextField({
    super.key,
    required this.hintText,
    this.prefixIcon,
    required this.controllerKey,
    this.nextFocusKey,
    this.validator,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(textControllersProvider(controllerKey));
    final currFocus = ref.watch(focusNodeProvider(controllerKey));

    return TextFormField(
      cursorColor: AppColors.error,
      controller: controller,
      keyboardType: keyboardType,
      obscureText: obscureText,
      obscuringCharacter: "*",
      style: const TextStyle(fontSize: 16),
      decoration: InputDecoration(
        prefixIcon: prefixIcon != null ? Icon(prefixIcon, size: 20) : null,
        hintText: hintText,
      ),
      focusNode: currFocus,
      canRequestFocus: true,
      textInputAction:
          nextFocusKey == null ? TextInputAction.done : TextInputAction.next,
      onFieldSubmitted: (_) {
        if (nextFocusKey != null) {
          final nextFocus = ref.read(focusNodeProvider(nextFocusKey!));
          FocusScope.of(context).requestFocus(nextFocus);
        } else {
          currFocus.unfocus();
        }
      },
      validator: validator ?? (v) => Validators.requiredField(v),
    );
  }
}
