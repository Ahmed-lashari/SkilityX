import 'package:flutter/material.dart';
import 'package:skility_x/constants/app_colors.dart';
import 'package:skility_x/core/config/route_config.dart';
import 'package:skility_x/core/utils.dart/utils.dart';
import 'package:skility_x/view/screens/home/1_skills/3_filter_screen.dart';
import 'package:skility_x/view/widgets/image_ui.dart';

import 'package:skility_x/constants/app_keys/hero_keys.dart';
import 'package:skility_x/constants/app_keys/image_keys.dart';
import 'package:skility_x/view/ui_config/view/screens/home/1_skills/3_filter_screen.dart';
import 'package:skility_x/view/widgets/custom_widgets.dart';

class SkillCard extends StatelessWidget {
  final FilterColorModel colorModel;
  final int index;
  final bool showLearningButton;
  final Color? navIconColor;
  const SkillCard(
      {required this.colorModel,
      required this.index,
      this.navIconColor,
      this.showLearningButton = false});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: Utils.getWeidth(context),
        // height: Utils.getHeight(context) * 0.4,
        margin: const EdgeInsets.only(bottom: 5),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: colorModel.boxColor,
        ),
        child: Column(
          spacing: 10,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // username and picture
            _buildPrsonalDetails(context),

            // course details
            _buildDescription(),

            // days + lessons + start LEarning button
            _buildButtons(context),
          ],
        ));
  }

  Widget _buildPrsonalDetails(BuildContext context) {
    return Row(
      children: [
        _buildNavButton(context),
        _buildUserNameSkill(),
        _buildPicture(),
      ],
    );
  }

  Widget _buildNavButton(BuildContext context) {
    return (!showLearningButton)
        ? CustomWidgets.backNavigationIconButt(
            context: context, iconColor: navIconColor)
        : SizedBox.shrink();
  }

  Widget _buildUserNameSkill() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Hero(
          tag: "${HeroKeys.filterUserNameKey}_$index",
          child: Material(
            type: MaterialType.transparency,
            child: Text(
              'Fatima Noman',
              style: TextStyle(
                  color: colorModel.textColor,
                  fontSize: 25,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
        Text(
          'Artificial intelligence',
          style: TextStyle(
              color: colorModel.textColor,
              fontSize: 16,
              fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  Widget _buildPicture() {
    return Hero(
      tag: "${HeroKeys.filterProfileKey}_$index",
      child: ProfilePicture(
        imageSize: 80,
        url: AvatarKeys.pokieBoy,
      ),
    );
  }

  Widget _buildDescription() {
    return Text(
      'I am an Artificial Inteligence Engineer and willing to help beginners or fresh developer into building Ai models. Feel free to reach me out using the provided deep links.',
      maxLines: 4,
      textAlign: TextAlign.justify,
      style: TextStyle(
          color: colorModel.textColor,
          fontSize: 14,
          overflow: TextOverflow.ellipsis),
    );
  }

  Widget _buildButtons(BuildContext context) {
    return Container(
        width: Utils.getWeidth(context),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: AppColors.background,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.min,
          children: [
            // lessons and duration
            _buildDaysLessons(),

            // start learingn button
            if (showLearningButton)
              CustomWidgets.anotherActionButton(context, index, colorModel),
          ],
        ));
  }

  Widget _buildDaysLessons() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // days
        Row(
          spacing: 16,
          children: [
            Text(
              '30',
              maxLines: 4,
              textAlign: TextAlign.justify,
              style: TextStyle(
                  color: colorModel.textColor,
                  fontSize: 16,
                  overflow: TextOverflow.ellipsis,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              'Days',
              maxLines: 4,
              textAlign: TextAlign.justify,
              style: TextStyle(
                  color: colorModel.textColor,
                  fontSize: 14,
                  overflow: TextOverflow.ellipsis),
            ),
          ],
        ),

        // lessons
        Row(
          spacing: 16,
          children: [
            Text(
              '30',
              maxLines: 4,
              textAlign: TextAlign.justify,
              style: TextStyle(
                  color: colorModel.textColor,
                  fontSize: 16,
                  overflow: TextOverflow.ellipsis,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              'Lessons',
              maxLines: 4,
              textAlign: TextAlign.justify,
              style: TextStyle(
                  color: colorModel.textColor,
                  fontSize: 14,
                  overflow: TextOverflow.ellipsis),
            ),
          ],
        ),
      ],
    );
  }
}

class CategoryCard extends StatelessWidget {
  final String icon;
  final String label;
  final Color backgroundColor;
  final Color iconColor;

  const CategoryCard({
    required this.icon,
    required this.label,
    required this.backgroundColor,
    required this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: InkWell(
        splashColor: iconColor.withAlpha(100),
        onTap: () => AppNavigator.navigateTo(context,
            wRoute: FilterScreen(skillKey: label, color: iconColor)),
        borderRadius: BorderRadius.circular(16),
        child: Ink(
          height: Utils.getHeight(context) * 0.2,
          width: Utils.getHeight(context) * 0.2,
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                  child: CustomIcon(
                icon: icon,
                color: iconColor,
                iconSize: 45,
              )),
              Text(
                label,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: iconColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
