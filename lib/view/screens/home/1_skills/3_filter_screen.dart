import 'package:flutter/material.dart';
import 'package:skility_x/constants/app_colors.dart';
import 'package:skility_x/view/ui_config/view/screens/home/1_skills/3_filter_screen.dart';
import 'package:skility_x/view/ui_config/view/screens/home/1_skills/skill_card.dart';
import 'package:skility_x/view/widgets/custom_scaffold.dart';
import 'package:skility_x/view/widgets/custom_widgets.dart';

class FilterScreen extends StatefulWidget {
  final String skillKey;
  final Color color;
  const FilterScreen({super.key, required this.skillKey, required this.color});

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  List<FilterColorModel> isList = [];
  @override
  void initState() {
    super.initState();

    isList = FilterScreenConfig.getColorsLists();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // title and back navigation
          _buildHeader(context),

          // list cards
          _buildListCards()
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CustomWidgets.backNavigationIconButt(context: context),
        Text(
          widget.skillKey,
          style: TextStyle(
              color: (widget.color == AppColors.unselectedItemIcon)
                  ? AppColors.onBackground
                  : widget.color,
              fontSize: 20),
        ),
      ],
    );
  }

  Widget _buildListCards() {
    return Expanded(
      child: ListView.builder(
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          itemCount: 5,
          itemBuilder: (context, index) {
            final i = FilterScreenConfig.getColorIndex(index, isList.length);

            final colorScheme = isList[i];
            return SkillCard(
                colorModel: colorScheme,
                index: index,
                showLearningButton: true);
          }),
    );
  }
}
