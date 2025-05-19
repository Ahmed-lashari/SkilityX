import 'package:flutter/material.dart';
import 'package:skility_x/constants/app_colors.dart';
import 'package:skility_x/core/config/route_config.dart';
import 'package:skility_x/core/utils.dart/utils.dart';
import 'package:skility_x/models/SkillsOffered/skills_offered.dart';
import 'package:skility_x/view/screens/home/1_skills/3_filter_screen.dart';
import 'package:skility_x/view/themes/theme_conts/typography.dart';
import 'package:skility_x/view/widgets/image_ui.dart';

import 'package:skility_x/constants/app_keys/hero_keys.dart';
import 'package:skility_x/view/ui_config/view/screens/home/1_skills/3_filter_screen.dart';
import 'package:skility_x/view/widgets/custom_widgets.dart';

class SkillCard extends StatelessWidget {
  final FilterColorModel colorModel;
  final int index;
  final SkillsOffered data;
  final bool showLearningButton;
  final Color? navIconColor;
  const SkillCard(
      {required this.colorModel,
      required this.index,
      required this.data,
      this.navIconColor,
      this.showLearningButton = false});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: Utils.getWeidth(context),
        margin: const EdgeInsets.only(bottom: 12),
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
            _buildPrsonalDetails(context, data),

            // course details
            _buildDescription(data.description),

            // days + lessons + start LEarning button
            _buildButtons(context, data),
          ],
        ));
  }

  Widget _buildPrsonalDetails(BuildContext context, SkillsOffered data) {
    return Row(
      children: [
        _buildNavButton(context),
        _buildUserNameSkill(data),
        _buildPicture(data.uploaderPicUrl),
      ],
    );
  }

  Widget _buildNavButton(BuildContext context) {
    return (!showLearningButton)
        ? CustomWidgets.backNavigationIconButt(
            context: context, iconColor: navIconColor)
        : SizedBox.shrink();
  }

  Widget _buildUserNameSkill(SkillsOffered data) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            data.title,
            style: TextStyle(
                color: colorModel.textColor,
                fontSize: 20,
                fontFamily: AppTypography.scotishBold,
                fontWeight: FontWeight.bold),
          ),
          Hero(
              tag: "${HeroKeys.filterUserNameKey}_$index",
              child: Material(
                type: MaterialType.transparency,
                child: Text(
                  "by: ${data.uploaderName}",
                  style: TextStyle(
                      color: colorModel.textColor,
                      fontSize: 16,
                      fontFamily: AppTypography.scotishBold,
                      fontWeight: FontWeight.bold),
                ),
              ))
        ],
      ),
    );
  }

  Widget _buildPicture(String url) {
    return Hero(
      tag: "${HeroKeys.filterProfileKey}_$index",
      child: ProfilePicture(
        imageSize: 80,
        url: url,
      ),
    );
  }

  Widget _buildDescription(String description) {
    return Text(
      description,
      maxLines: 4,
      textAlign: TextAlign.justify,
      style: TextStyle(
          color: colorModel.textColor,
          fontSize: 14,
          overflow: TextOverflow.ellipsis),
    );
  }

  Widget _buildButtons(BuildContext context, SkillsOffered data) {
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
            _buildDaysLessons(data),

            // start learingn button
            if (showLearningButton)
              CustomWidgets.anotherActionButton(
                  context, index, colorModel, data),
          ],
        ));
  }

  Widget _buildDaysLessons(SkillsOffered data) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // days
        Row(
          spacing: 16,
          children: [
            Text(
              data.courseDuration,
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
              data.courseLessons,
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
