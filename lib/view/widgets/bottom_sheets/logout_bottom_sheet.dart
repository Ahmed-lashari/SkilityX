import 'package:flutter/material.dart';
import 'package:skility_x/constants/app_colors.dart';
import 'package:skility_x/core/config/route_config.dart';
import 'package:skility_x/core/utils.dart/utils.dart';
import 'package:skility_x/data_source/repository/auth/common_features.dart';
import 'package:skility_x/view/screens/auth/auth_screen.dart';
import 'package:skility_x/view/widgets/custom_widgets.dart';

class LogoutBottomSheet extends StatelessWidget {
  const LogoutBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 10,
      children: [
        Text('Are you sure you want to logout now?', style: TextStyle()),
        Row(
          spacing: 10,
          children: [
            Expanded(
              child: CustomWidgets.actionButton(
                  backgroundColor: AppColors.onBackground.withAlpha(100),
                  textColor: AppColors.onBackground,
                  label: 'Yes',
                  onPressed: () async {
                    Utils.showLoading(context);
                    await AuthCommon.logout(context);
                    AppNavigator.navigateBack(context);
                    await AppNavigator.startAsInitial(context,
                        widgetRoute: AuthScreen());
                    Utils.cancelLoading(context);
                  }),
            ),
            Expanded(
              child: CustomWidgets.actionButton(
                  backgroundColor: AppColors.onBackground,
                  textColor: AppColors.error,
                  label: 'No',
                  onPressed: () async => AppNavigator.navigateBack(context)),
            ),
          ],
        )
      ],
    );
  }
}
