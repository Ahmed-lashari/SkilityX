import 'package:flutter/material.dart';
import 'package:skility_x/constants/app-icons.dart';
import 'package:skility_x/constants/app_keys/drop_down_keys.dart';
import 'package:skility_x/view/ui_config/view/screens/home/1_skills/1_skills_offered.dart';
import 'package:skility_x/view/ui_config/view/screens/home/1_skills/2_filter_menu.dart';
import 'package:skility_x/view/widgets/app_bar.dart';
import 'package:skility_x/view/widgets/app_drop_down.dart';
import 'package:skility_x/view/widgets/custom_scaffold.dart';
import 'package:skility_x/view/widgets/skills_banner.dart';

class FilterSkills extends StatefulWidget {
  const FilterSkills({super.key});

  @override
  State<FilterSkills> createState() => _FilterSkillsState();
}

class _FilterSkillsState extends State<FilterSkills> {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      isScrollable: true,
      appBar: myAppBar(
          context: context,
          showLeading: true,
          title: myDropDwon(
              contentpadding: EdgeInsets.symmetric(horizontal: 10, vertical: 0),
              prefixIcon: AppStaticIcons.search,
              hintText: 'Search...',
              dropdwonKey: DropDownKeys.searchSkills)),
      body: Column(
        spacing: 16,
        children: [
          SizedBox.shrink(),

          // academic skills
          SkillsCard("Academics", _academicList),

          // artistic skills
          SkillsCard("Artistic", _artisticList),

          // language skills
          SkillsCard("Language", _languageList),

          // tech skills
          SkillsCard("Technical", _techList),

          SizedBox.shrink(),
        ],
      ),
    );
  }

  Widget SkillsCard(String label, List<SkillsBanners> list) {
    return Column(
      spacing: 5,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          " " + label,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            spacing: 5,
            children: List.generate(list.length, (index) {
              return _buildSkillsBanners(list, index);
            }),
          ),
        )
      ],
    );
  }

  Widget _buildSkillsBanners(List<SkillsBanners> list, int index) {
    final iconColor =
        (index == list.length - 1) ? list[0].color : list[index + 1].color;

    return CategoryCard(
      icon: list[index].icon,
      iconColor: iconColor,
      label: list[index].label,
      backgroundColor: list[index].color,
    );
  }

  List<SkillsBanners> _academicList = [];
  List<SkillsBanners> _artisticList = [];
  List<SkillsBanners> _languageList = [];
  List<SkillsBanners> _techList = [];

  @override
  void initState() {
    super.initState();

    _academicList = FilterMenuConfig.getAcademicSkillsBanners();
    _artisticList = FilterMenuConfig.getArtisticSkillsBanners();
    _languageList = FilterMenuConfig.getLanguageSkillsBanners();
    _techList = FilterMenuConfig.getTechSkillsBanners();
  }
}
