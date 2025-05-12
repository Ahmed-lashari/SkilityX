import 'package:flutter/material.dart';
import 'package:skility_x/constants/app_keys/hero_keys.dart';
import 'package:skility_x/constants/app_keys/image_avatar_keys.dart';
import 'package:skility_x/core/config/route_config.dart';
import 'package:skility_x/core/utils.dart/utils.dart';
import 'package:skility_x/view/screens/home/1_skills/4_skill_details.dart';
import 'package:skility_x/view/ui_config/view/screens/home/1_skills/3_filter_screen.dart';
import 'package:skility_x/view/widgets/custom_widgets.dart';
import 'package:skility_x/view/widgets/image_ui.dart';

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
        height: Utils.getHeight(context) * 0.4,
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
            Row(
              children: [
                if (!showLearningButton)
                  CustomWidgets.backNavigationIconButt(
                      context: context, iconColor: navIconColor),
                Expanded(
                  child: Column(
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
                  ),
                ),
                Hero(
                  tag: "${HeroKeys.filterProfileKey}_$index",
                  child: ProfilePicture(
                    imageSize: 80,
                    url: AvatarKeys.pokieBoy,
                  ),
                )
              ],
            ),
            Text(
              'I am an Artificial Inteligence Engineer and willing to help beginners or fresh developer into building Ai models. Feel free to reach me out using the provided deep links.',
              maxLines: 4,
              textAlign: TextAlign.justify,
              style: TextStyle(
                  color: colorModel.textColor,
                  fontSize: 14,
                  overflow: TextOverflow.ellipsis),
            ),
            Flexible(
              child: Container(
                  width: Utils.getWeidth(context),
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: colorModel.textColor.withAlpha(150),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // days and lessons text
                      _buildDaysLessons(),

                      // start learingn button
                      if (showLearningButton)
                        _buildActionButton(context, index),
                    ],
                  )),
            )
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
                  color: colorModel.boxColor,
                  fontSize: 16,
                  overflow: TextOverflow.ellipsis,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              'Days',
              maxLines: 4,
              textAlign: TextAlign.justify,
              style: TextStyle(
                  color: colorModel.boxColor,
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
                  color: colorModel.boxColor,
                  fontSize: 16,
                  overflow: TextOverflow.ellipsis,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              'Lessons',
              maxLines: 4,
              textAlign: TextAlign.justify,
              style: TextStyle(
                  color: colorModel.boxColor,
                  fontSize: 14,
                  overflow: TextOverflow.ellipsis),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildActionButton(BuildContext context, int index) {
    return Material(
      type: MaterialType.transparency,
      child: InkWell(
        onTap: () => AppNavigator.navigateTo(context,
            wRoute: SkillDetailsScreen(
              index: index,
              color: colorModel,
            )),
        borderRadius: BorderRadius.circular(16),
        splashColor: colorModel.textColor,
        child: Ink(
            height: Utils.getHeight(context),
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: colorModel.boxColor,
            ),
            child: Center(
                child: Text(
              'Start Learning',
              style: TextStyle(color: colorModel.textColor),
            ))),
      ),
    );
  }
}
