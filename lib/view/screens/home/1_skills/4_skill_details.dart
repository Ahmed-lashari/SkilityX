import 'package:flutter/material.dart';
import 'package:skility_x/constants/app_colors.dart';
import 'package:skility_x/constants/app_keys/hero_keys.dart';
import 'package:skility_x/constants/app_keys/image_avatar_keys.dart';
import 'package:skility_x/core/config/route_config.dart';
import 'package:skility_x/core/utils.dart/utils.dart';
import 'package:skility_x/view/screens/home/1_skills/5_request_form.dart';
import 'package:skility_x/view/ui_config/view/screens/home/1_skills/3_filter_screen.dart';
import 'package:skility_x/view/widgets/custom_scaffold.dart';
import 'package:skility_x/view/widgets/custom_widgets.dart';
import 'package:skility_x/view/widgets/image_ui.dart';

class SkillDetailsScreen extends StatelessWidget {
  final int index;
  final FilterColorModel color;
  const SkillDetailsScreen(
      {super.key, required this.index, required this.color});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: Column(
        spacing: 16,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _buildHeader(context),
          _buildProfilePic(index),
          _buildTextDetails(context, index),
          _buildNavigationButton(context),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Row(
      children: [
        CustomWidgets.backNavigationIconButt(context: context),
        Hero(
          tag: "${HeroKeys.filterUserNameKey}_$index",
          child: Material(
            type: MaterialType.transparency,
            child: Text(
              'Fatima Noman',
              style: TextStyle(color: color.textColor, fontSize: 18),
            ),
          ),
        )
      ],
    );
  }

  Widget _buildProfilePic(int index) {
    return Hero(
        tag: "${HeroKeys.filterProfileKey}_$index",
        child: ProfilePicture(imageSize: 100, url: AvatarKeys.pokieBoy));
  }

  Widget _buildTextDetails(BuildContext context, int index) {
    return Column(
      spacing: 20,
      children: [
        Text(
          'I am an Artificial Inteligence Engineer and willing to help beginners or fresh developer into building Ai models. Feel free to reach me out using the provided deep links.',
          textAlign: TextAlign.justify,
          style: TextStyle(color: AppColors.onSecondary, fontSize: 14),
        ),
        _buildTextData(context),
      ],
    );
  }

  Widget _buildTextData(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      spacing: 5,
      children: [
        _buildTexttualPoints(context: context, title: "Lessons", value: "32"),
        _buildTexttualPoints(context: context, title: "Days", value: "30"),
        _buildTexttualPoints(context: context, title: "Charges", value: "4000"),
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

  Widget _buildNavigationButton(BuildContext context) {
    return Hero(
      tag: "${HeroKeys.actionButtonKey}_$index",
      child: CustomWidgets.actionButton(
          label: "Send Request",
          onPressed: () => AppNavigator.navigateTo(context,
              wRoute: SkillRequestForm(index: index, color: color))),
    );
  }
}
