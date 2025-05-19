import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skility_x/constants/app-icons.dart';
import 'package:skility_x/constants/app_colors.dart';
import 'package:skility_x/constants/app_keys/drop_down_keys.dart';
import 'package:skility_x/constants/app_keys/hero_keys.dart';
import 'package:skility_x/constants/app_keys/text_controller_keys.dart';
import 'package:skility_x/models/Users/users.dart';
import 'package:skility_x/view-model/action_controllers.dart/view/screens/home/3_profile/2_adv_course_screen_action.dart';
import 'package:skility_x/view/widgets/app_drop_down.dart';
import 'package:skility_x/view/widgets/app_textfield.dart';
import 'package:skility_x/view/widgets/custom_scaffold.dart';
import 'package:skility_x/view/widgets/custom_widgets.dart';

class AdvertiseCourseScreen extends ConsumerStatefulWidget {
  final Users user;
  const AdvertiseCourseScreen({super.key, required this.user});

  @override
  ConsumerState<AdvertiseCourseScreen> createState() =>
      _AdvertiseCourseScreenState();
}

class _AdvertiseCourseScreenState extends ConsumerState<AdvertiseCourseScreen> {
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      isScrollable: true,
      appBar: AppBar(
        title: Text('Upload Yur Course Details'),
        automaticallyImplyLeading: false,
        leading: CustomWidgets.backNavigationIconButt(context: context),
      ),
      body: Form(
        key: formKey,
        child: Column(
          spacing: 16,
          children: [
            myTextField(
              maxLength: 40,
              prefixIcon: AppStaticIcons.title,
              hintText: 'Title',
              controllerKey: TextControllerKeys.title,
              nextFocusKey: TextControllerKeys.description,
            ),
            myTextField(
              maxLines: 5,
              hintText: 'Description...',
              controllerKey: TextControllerKeys.description,
              nextFocusKey: DropDownKeys.searchSkills,
            ),
            myDropDwon(
              hintText: 'Category',
              prefixIcon: AppStaticIcons.skills,
              dropdwonKey: DropDownKeys.searchSkills,
              nextFocusKey: DropDownKeys.lessonsKey,
            ),
            myDropDwon(
              hintText: 'Total Lessons/Topics',
              prefixIcon: AppStaticIcons.lessons,
              dropdwonKey: DropDownKeys.lessonsKey,
              nextFocusKey: DropDownKeys.durationKey,
            ),
            myDropDwon(
              hintText: 'Duration (in Days)',
              prefixIcon: AppStaticIcons.duration,
              dropdwonKey: DropDownKeys.durationKey,
              nextFocusKey: DropDownKeys.amountKey,
            ),
            myDropDwon(
                hintText: 'Total Amount (in PKR)',
                prefixIcon: AppStaticIcons.amount,
                dropdwonKey: DropDownKeys.amountKey),
            Hero(
                tag: HeroKeys.fabActionHeroTag,
                child: CustomWidgets.actionButton(
                    backgroundColor: AppColors.error,
                    textColor: AppColors.onBackground,
                    label: "Upload",
                    onPressed: () => AdvertiseCourseAction.uploadCourseDetails(
                        context, ref, formKey, widget.user)))
          ],
        ),
      ),
    );
  }
}
