import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skility_x/constants/app_keys/hero_keys.dart';
import 'package:skility_x/constants/app_keys/text_controller_keys.dart';
import 'package:skility_x/models/SkillsOffered/skills_offered.dart';
import 'package:skility_x/view-model/action_controllers.dart/view/screens/home/1_skills/1_skills_offered_action.dart';
import 'package:skility_x/view/ui_config/view/screens/home/1_skills/3_filter_screen.dart';
import 'package:skility_x/view/widgets/app_textfield.dart';
import 'package:skility_x/view/widgets/custom_scaffold.dart';
import 'package:skility_x/view/widgets/custom_widgets.dart';
import 'package:skility_x/view/widgets/skills_banner.dart';

class SkillRequestForm extends ConsumerStatefulWidget {
  final int index;
  final SkillsOffered data;
  final FilterColorModel color;
  const SkillRequestForm(
      {super.key,
      required this.data,
      required this.index,
      required this.color});

  @override
  ConsumerState<SkillRequestForm> createState() => Skill_RequestFormState();
}

class Skill_RequestFormState extends ConsumerState<SkillRequestForm> {
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      isScrollable: true,
      body: Column(
        spacing: 16,
        children: [
          SizedBox.shrink(),
          SkillCard(
            data: widget.data,
            colorModel: widget.color,
            index: widget.index,
            showLearningButton: false,
            navIconColor: widget.color.textColor,
          ),
          _buildForm(),
          Hero(
            tag: "${HeroKeys.actionButtonKey}_${widget.index}",
            child: CustomWidgets.actionButton(
                label: "Submit Request",
                backgroundColor: widget.color.boxColor,
                textColor: widget.color.textColor,
                onPressed: () => SkillsRequestdAction.sendRequest(
                    context, ref, formKey, widget.data)),
          )
        ],
      ),
    );
  }

  Widget _buildForm() {
    return Form(
      key: formKey,
      child: myTextField(
          maxLines: 5,
          hintText: 'Short Description',
          controllerKey: TextControllerKeys.description),
    );
  }
}
