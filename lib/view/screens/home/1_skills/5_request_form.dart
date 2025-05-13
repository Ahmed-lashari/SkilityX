import 'package:flutter/material.dart';
import 'package:skility_x/constants/app-icons.dart';
import 'package:skility_x/constants/app_keys/hero_keys.dart';
import 'package:skility_x/constants/app_keys/text_controller_keys.dart';
import 'package:skility_x/core/utils.dart/validators.dart';
import 'package:skility_x/view/ui_config/view/screens/home/1_skills/3_filter_screen.dart';
import 'package:skility_x/view/widgets/app_textfield.dart';
import 'package:skility_x/view/widgets/custom_scaffold.dart';
import 'package:skility_x/view/widgets/custom_widgets.dart';
import 'package:skility_x/view/widgets/skills_banner.dart';

class SkillRequestForm extends StatefulWidget {
  final int index;
  final FilterColorModel color;
  const SkillRequestForm({super.key, required this.index, required this.color});

  @override
  State<SkillRequestForm> createState() => Skill_RequestFormState();
}

class Skill_RequestFormState extends State<SkillRequestForm> {
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
                onPressed: () => Validators.validateForm(formKey)),
          )
        ],
      ),
    );
  }

  Widget _buildForm() {
    return Form(
      key: formKey,
      child: Column(
        spacing: 16,
        children: [
          myTextField(
            hintText: 'Name',
            controllerKey: TextControllerKeys.nameKey,
            prefixIcon: AppStaticIcons.person,
            prefixIconColor: widget.color.textColor,
          ),
          myTextField(
              maxLines: 5,
              hintText: 'Short Description',
              controllerKey: TextControllerKeys.dexcriptionKey),
        ],
      ),
    );
  }
}
