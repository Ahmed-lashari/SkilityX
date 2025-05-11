import 'package:flutter/material.dart';
import 'package:skility_x/constants/app-icons.dart';
import 'package:skility_x/constants/app_keys/text_controller_keys.dart';
import 'package:skility_x/view/widgets/app_textfield.dart';
import 'package:skility_x/view/widgets/custom_scaffold.dart';

class FilterSkills extends StatelessWidget {
  const FilterSkills({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: Column(
        children: [
          myTextField(
              prefixIcon: AppStaticIcons.search,
              hintText: 'Search...',
              controllerKey: TextControllerKeys.searchSkills)
        ],
      ),
    );
  }
}
