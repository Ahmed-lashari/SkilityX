import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skility_x/constants/app_colors.dart';
import 'package:skility_x/models/SkillsOffered/skills_offered.dart';
import 'package:skility_x/view-model/data_providers/view/screen/home/1_skills/2_filter_screen.dart';
import 'package:skility_x/view/ui_config/view/screens/home/1_skills/3_filter_screen.dart';
import 'package:skility_x/view/widgets/app_bar.dart';
import 'package:skility_x/view/widgets/custom_progress_indicator.dart';
import 'package:skility_x/view/widgets/custom_scaffold.dart';
import 'package:skility_x/view/widgets/skills_banner.dart';

class FilterScreen extends ConsumerStatefulWidget {
  final String skillKey;
  final Color color;
  const FilterScreen({super.key, required this.skillKey, required this.color});

  @override
  ConsumerState<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends ConsumerState<FilterScreen> {
  List<FilterColorModel> isList = [];
  @override
  void initState() {
    super.initState();

    isList = FilterScreenConfig.getColorsLists();
  }

  @override
  Widget build(BuildContext context) {
    final data = ref.watch(offeredSkillsProvider(widget.skillKey));
    return CustomScaffold(
      appBar: myAppBar(
          context: context,
          title: Text(
            widget.skillKey,
            style: TextStyle(
                color: (widget.color == AppColors.unselectedItemIcon)
                    ? AppColors.onBackground
                    : widget.color,
                fontSize: 20),
          ),
          showLeading: true),
      body: _buildListCards(data),
    );
  }

  Widget _buildListCards(AsyncValue<List<SkillsOffered>> data) {
    return data.when(
        loading: () => Center(child: GradientCircularProgress()),
        error: (error, stackTrace) => Text(error.toString()),
        data: (docs) {
          if (docs.isEmpty) {
            return Center(child: Text("No Courses available for this key!"));
          }

          return Column(
            spacing: 16,
            children: [
              SizedBox.shrink(),
              Expanded(
                child: ListView.builder(
                    // shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    itemCount: docs.length,
                    itemBuilder: (context, index) {
                      final i = FilterScreenConfig.getColorIndex(
                          index, isList.length);

                      final colorScheme = isList[i];
                      final obj = docs[index];
                      return SkillCard(
                          data: obj,
                          colorModel: colorScheme,
                          index: index,
                          showLearningButton: true);
                    }),
              ),
            ],
          );
        });
  }
}
