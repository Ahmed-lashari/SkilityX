import 'package:flutter/material.dart';
import 'package:skility_x/constants/app_colors.dart';
import 'package:skility_x/core/config/route_config.dart';
import 'package:skility_x/core/utils.dart/utils.dart';
import 'package:skility_x/view/ui_config/view/screens/home/1_skills/1_skills_offered.dart';
import 'package:skility_x/view/widgets/custom_scaffold.dart';
import 'package:skility_x/view/widgets/image_ui.dart';
import 'package:skility_x/view/widgets/skills_banner.dart';

class SkillsScreen extends StatefulWidget {
  const SkillsScreen({super.key});

  @override
  State<SkillsScreen> createState() => _SkillsScreenState();
}

class _SkillsScreenState extends State<SkillsScreen> {
  @override
  Widget build(BuildContext context) {
    debugPrint('building skills offers screen');
    return CustomScaffold(
      hPadding: 0,
      isScrollable: true,
      body: Column(
        spacing: 16,
        children: [
          SizedBox.shrink(),
          _ExploreSkills(),
          _OurExperts(),
          SizedBox(height: 35),
        ],
      ),
    );
  }

  List<SkillsBanners> _skillsList = [];
  List<OurExperts> _expertsList = [];

  @override
  void initState() {
    super.initState();
    _skillsList = SkillsOfferedConfig.getSkillsBanners();
    _expertsList = SkillsOfferedConfig.getExpertsList();
  }

  Widget _ExploreSkills() {
    return Column(
      spacing: 5,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              "Explore Skills",
              style: TextStyle(fontSize: 20),
            ),
            GestureDetector(
              onTap: () => AppNavigator.navigateTo(context,
                  sRoute: RouteEnum.filterMenu.path),
              child: Text("View All",
                  style: TextStyle(
                      fontSize: 12,
                      color: AppColors.secondary,
                      fontWeight: FontWeight.bold)),
            ),
          ],
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            spacing: 5,
            children: List.generate(_skillsList.length, (index) {
              return _buildSkillsBanners(index);
            }),
          ),
        )
      ],
    );
  }

  Widget _buildSkillsBanners(int index) {
    final iconColor = (index == _skillsList.length - 1)
        ? _skillsList[0].color
        : _skillsList[index + 1].color;

    return CategoryCard(
      icon: _skillsList[index].icon,
      iconColor: iconColor,
      label: _skillsList[index].label,
      backgroundColor: _skillsList[index].color,
    );
  }

  Widget _OurExperts() {
    return Column(
      spacing: 0,
      children: [
        Container(
          width: Utils.getWeidth(context),
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
              color: AppColors.secondary,
              borderRadius: BorderRadius.vertical(top: Radius.circular(16))),
          child: Text(
            "Our Experts",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 20,
                color: AppColors.onBackground,
                fontWeight: FontWeight.bold),
          ),
        ),
        Container(
          padding: const EdgeInsets.all(10),
          color: AppColors.onBackground,
          child: GridView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: _expertsList.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3, mainAxisSpacing: 8, crossAxisSpacing: 5),
            itemBuilder: (context, index) {
              final expert = _expertsList[index];
              return _buildExpertUi(expert);
            },
          ),
        ),
      ],
    );
  }

  Widget _buildExpertUi(OurExperts expert) {
    return Container(
      // color: AppColors.secondary,
      child: Column(
        children: [
          // display image
          ClipOval(
              child: Container(
            padding: EdgeInsets.all(3),
            color: AppColors.error,
            child: ProfilePicture(
              url: expert.imageurl,
              imageSize: 60,
            ),
          )),
          // user anme and skill
          _builtNameAndSkill(expert)
        ],
      ),
    );
  }

  Widget _builtNameAndSkill(OurExperts expert) {
    return Column(
      children: [
        Text(
          expert.name,
          style: TextStyle(color: AppColors.error, fontSize: 13),
        ),
        Text(
          expert.skill,
          style: TextStyle(color: AppColors.secondary, fontSize: 10),
        ),
      ],
    );
  }
}
