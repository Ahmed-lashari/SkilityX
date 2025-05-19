import 'package:flutter/material.dart';
import 'package:skility_x/constants/app-icons.dart';
import 'package:skility_x/constants/app_colors.dart';
import 'package:skility_x/core/config/route_config.dart';
import 'package:skility_x/models/Users/users.dart';
import 'package:skility_x/view/screens/home/4_settings/cover_photo_setting.dart';
import 'package:skility_x/view/themes/theme_conts/typography.dart';
import 'package:skility_x/view/widgets/app_bar.dart';
import 'package:skility_x/view/widgets/custom_scaffold.dart';
import 'package:skility_x/view/widgets/image_ui.dart';

class SettingsScreen extends StatelessWidget {
  final Users user;
  const SettingsScreen({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appBar: myAppBar(
          context: context, title: Text('Settings'), showLeading: true),
      body: Column(
        spacing: 10,
        children: [
          SizedBox.shrink(),
          _SettingsTileCard(
              onTap: () => AppNavigator.navigateTo(context,
                  wRoute: CoverPhotoSetting(user: user)),
              leadingIcon: AppImageIcons.camera,
              title: "Cover Photos"),
          _SettingsTileCard(
              onTap: () {},
              leadingIcon: AppImageIcons.camera,
              title: "Log Out"),
        ],
      ),
    );
  }
}

class _SettingsTileCard extends StatelessWidget {
  final String leadingIcon;
  final String title;
  final VoidCallback? onTap;

  const _SettingsTileCard({
    required this.leadingIcon,
    required this.title,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: InkWell(
        onTap: onTap,
        splashColor: AppColors.onBackground,
        borderRadius: BorderRadius.circular(12),
        child: Ink(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: AppColors.unselectedItemIcon),
          child: ListTile(
            // contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            leading: CustomIcon(
              icon: leadingIcon,
              color: AppColors.secondary,
              iconSize: 30,
            ),
            title: Text(
              title,
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontFamily: AppTypography.scotishMedium),
            ),
            trailing: CustomIcon(
              icon: AppImageIcons.rightarrow,
              color: AppColors.secondary,
              iconSize: 20,
            ),
            onTap: null,
          ),
        ),
      ),
    );
  }
}
