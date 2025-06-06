import 'package:flutter/material.dart';
import 'package:skility_x/constants/app-icons.dart';
import 'package:skility_x/constants/app_colors.dart';
import 'package:skility_x/core/config/route_config.dart';
import 'package:skility_x/core/utils.dart/utils.dart';
import 'package:skility_x/models/Users/users.dart';
import 'package:skility_x/view/screens/home/4_settings/0_settings.dart';
import 'package:skility_x/view/themes/theme_conts/typography.dart';
import 'package:skility_x/view/widgets/custom_scaffold.dart';
import 'package:skility_x/view/widgets/image_ui.dart';

class myDrawer extends StatefulWidget {
  final GlobalKey<CustomScaffoldState> persistentkey;
  final Users user;
  const myDrawer({super.key, required this.persistentkey, required this.user});

  @override
  State<myDrawer> createState() => _myDrawerState();
}

class _myDrawerState extends State<myDrawer> {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      backGroundColor: AppColors.onSecondary.withAlpha(0),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 0),
        child: Column(
          spacing: 00,
          children: [
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                onPressed: () => Utils.closeDrawer(widget.persistentkey),
                icon: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      color: AppColors.error,
                      borderRadius: BorderRadius.circular(16)),
                  child: CustomIcon(
                    icon: AppImageIcons.leftarrow,
                    color: AppColors.onBackground,
                    iconSize: 25,
                  ),
                ),
              ),
            ),
            CircleAvatar(
              radius: 80,
              backgroundImage:
                  NetworkImage("${widget.user.profilePicUrl.toString()}"),
            ),
            SizedBox(height: 20),
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: AppColors.error,
                  borderRadius: BorderRadius.circular(16)),
              child: Column(
                children: [
                  Text(
                    widget.user.name,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 22,
                        fontFamily: AppTypography.scotishBold,
                        color: AppColors.onSecondary),
                  ),
                  Text(
                    widget.user.mainSkill,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 16,
                        fontFamily: AppTypography.scotishBold,
                        color: AppColors.onSecondary),
                  ),
                ],
              ),
            ),
            Spacer(),
            GestureDetector(
              onTap: () => AppNavigator.navigateTo(context,
                  wRoute: SettingsScreen(user: widget.user)),
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                    color: AppColors.error,
                    borderRadius: BorderRadius.circular(16)),
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        spacing: 15,
                        children: [
                          const Icon(
                            Icons.settings,
                            size: 30,
                          ),
                          Text(
                            'Settings',
                            style: TextStyle(
                                fontSize: 20,
                                fontFamily: AppTypography.scotishBold),
                          ),
                        ],
                      ),
                      const Icon(
                        Icons.arrow_forward_ios,
                      ),
                    ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
