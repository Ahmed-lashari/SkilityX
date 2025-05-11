import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skility_x/constants/app_colors.dart';
import 'package:skility_x/core/utils.dart/utils.dart';
import 'package:skility_x/view-model/ui_providers/view/screen/auth/toggle_button.dart';
import 'package:skility_x/view/screens/auth/login/login.dart';
import 'package:skility_x/view/screens/auth/signup/signup.dart';
import 'package:skility_x/view/themes/theme_conts/typography.dart';
import 'package:skility_x/view/widgets/custom_scaffold.dart';
import 'package:skility_x/view/widgets/toggle_button.dart';

class AuthScreen extends ConsumerStatefulWidget {
  AuthScreen({super.key});

  @override
  ConsumerState<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends ConsumerState<AuthScreen> {
  final instance1 = LoginUi();

  final instance2 = SignUpUi();

  final toggleButton = ToggleFilterButton();
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: Column(
        children: [_buildInfoUi(), _buildAuthUi()],
      ),
    );
  }

  Widget _buildInfoUi() {
    return Expanded(
      flex: 3,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          spacing: 16,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              spacing: 20,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/skility_x_icon/skility_x.png', scale: 20),
                Text(
                  "SkilityX",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    color: AppColors.onSecondary,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    fontFamily: AppTypography.interMedium,
                  ),
                ),
              ],
            ),
            Text(
              "Go ahead and continue to\nyour account.",
              textAlign: TextAlign.start,
              style: TextStyle(
                color: AppColors.onSecondary,
                fontSize: 20,
                fontFamily: AppTypography.interRegular,
              ),
            ),
            // SizedBox.shrink()
          ],
        ),
      ),
    );
  }

  Widget _buildAuthUi() {
    return Expanded(
      flex: 7,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        width: Utils.getWeidth(context),
        decoration: BoxDecoration(
            color: AppColors.onBackground,
            borderRadius: BorderRadius.vertical(top: Radius.circular(30))),
        child: Column(
          spacing: 7,
          children: [
            const SizedBox.shrink(),
            toggleButton,
            _displayPageViewContent(),
          ],
        ),
      ),
    );
  }

  Widget _displayPageViewContent() {
    return Expanded(
      child: PageView(
          controller: ref.read(filterPageController),
          onPageChanged: (index) => ref
              .read(filterPageController.notifier)
              .onPageChanged(index, ref, false),
          children: [instance1, instance2]),
    );
  }
}
