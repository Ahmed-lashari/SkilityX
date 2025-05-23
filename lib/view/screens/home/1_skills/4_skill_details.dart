import 'package:flutter/material.dart';
import 'package:skility_x/constants/app_colors.dart';
import 'package:skility_x/constants/app_keys/hero_keys.dart';
import 'package:skility_x/core/config/route_config.dart';
import 'package:skility_x/core/utils.dart/utils.dart';
import 'package:skility_x/models/SkillsOffered/skills_offered.dart';
import 'package:skility_x/view/screens/home/1_skills/5_request_form.dart';
import 'package:skility_x/view/ui_config/view/screens/home/1_skills/3_filter_screen.dart';
import 'package:skility_x/view/widgets/app_bar.dart';
import 'package:skility_x/view/widgets/custom_scaffold.dart';
import 'package:skility_x/view/widgets/custom_widgets.dart';
import 'package:skility_x/view/widgets/image_ui.dart';

class SkillDetailsScreen extends StatelessWidget {
  final int index;
  final SkillsOffered data;
  final FilterColorModel color;
  const SkillDetailsScreen(
      {super.key,
      required this.data,
      required this.index,
      required this.color});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appBar: myAppBar(
          context: context,
          showLeading: true,
          title: Hero(
            tag: "${HeroKeys.filterUserNameKey}_$index",
            child: Material(
              type: MaterialType.transparency,
              child: Text(
                data.uploaderName,
                style: TextStyle(color: color.textColor, fontSize: 18),
              ),
            ),
          )),
      body: SingleChildScrollView(
        child: Column(
          spacing: 16,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox.shrink(),
            _buildProfilePic(index, data.uploaderPicUrl),
            _buildTextDetails(context, index, data, color),
            _buildNavigationButton(context, data),
          ],
        ),
      ),
    );
  }

  Widget _buildProfilePic(int index, String url) {
    return Hero(
        tag: "${HeroKeys.filterProfileKey}_$index",
        child: ProfilePicture(imageSize: 100, url: "${url}"));
  }

  Widget _buildTextDetails(BuildContext context, int index, SkillsOffered data,
      FilterColorModel color) {
    return Column(
      spacing: 20,
      children: [
        Text(
          data.title,
          textAlign: TextAlign.center,
          style: TextStyle(color: color.textColor, fontSize: 18),
        ),
        Text(
          data.description,
          textAlign: TextAlign.justify,
          style: TextStyle(color: AppColors.onSecondary, fontSize: 14),
        ),
        _buildTextData(context, data),
      ],
    );
  }

  Widget _buildTextData(BuildContext context, SkillsOffered data) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      spacing: 5,
      children: [
        _buildTexttualPoints(
            context: context, title: "Lessons", value: data.courseLessons),
        _buildTexttualPoints(
            context: context, title: "Days", value: data.courseDuration),
        _buildTexttualPoints(
            context: context, title: "Charges", value: data.courseFee),
      ],
    );
  }

  Widget _buildTexttualPoints(
      {required BuildContext context,
      required String title,
      required String value}) {
    return Align(
      alignment: Alignment.centerLeft,
      child: SizedBox(
        width: Utils.getWeidth(context) * 0.5,
        child: Row(
          spacing: 10,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              textAlign: TextAlign.justify,
              style: TextStyle(color: color.textColor, fontSize: 16),
            ),
            Text(
              value,
              textAlign: TextAlign.justify,
              style: TextStyle(
                color: color.textColor,
                fontSize: 17,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNavigationButton(BuildContext context, SkillsOffered data) {
    return Hero(
      tag: "${HeroKeys.actionButtonKey}_$index",
      child: CustomWidgets.actionButton(
          label: "Send Request",
          onPressed: () => AppNavigator.navigateTo(context,
              wRoute:
                  SkillRequestForm(index: index, color: color, data: data))),
    );
  }
}
