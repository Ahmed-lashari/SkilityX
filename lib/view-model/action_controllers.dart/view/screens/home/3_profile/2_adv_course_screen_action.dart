import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skility_x/constants/app_keys/drop_down_keys.dart';
import 'package:skility_x/constants/app_keys/text_controller_keys.dart';
import 'package:skility_x/core/config/route_config.dart';
import 'package:skility_x/core/utils.dart/utils.dart';
import 'package:skility_x/core/utils.dart/validators.dart';
import 'package:skility_x/data_source/repository/firestore/firestore_skills_offered_repo.dart';
import 'package:skility_x/models/SkillsOffered/skills_offered.dart';
import 'package:skility_x/models/Users/users.dart';
import 'package:skility_x/view-model/data_providers/view/widgets/drop_down_list.dart';
import 'package:skility_x/view-model/data_providers/view/widgets/text_controllers.dart';
import 'package:toastification/toastification.dart';

class AdvertiseCourseAction {
  // upload course to firestore
  static Future<void> uploadCourseDetails(BuildContext context, WidgetRef ref,
      GlobalKey<FormState> formKey, Users uploader) async {
    if (!Validators.validateForm(formKey)) return;

    // overlay indicator
    Utils.showLoading(context);

    // create models
    final title = ref.read(controllerTextProvider(TextControllerKeys.title));
    final description =
        ref.read(controllerTextProvider(TextControllerKeys.description));
    final category = ref
        .read(formValuesProvider.notifier)
        .getValue(DropDownKeys.searchSkills);
    final lessons =
        ref.read(formValuesProvider.notifier).getValue(DropDownKeys.lessonsKey);
    final duration = ref
        .read(formValuesProvider.notifier)
        .getValue(DropDownKeys.durationKey);
    final amount =
        ref.read(formValuesProvider.notifier).getValue(DropDownKeys.amountKey);

    SkillsOffered skillOffered = SkillsOffered(
        offerId: '',
        title: title,
        description: description,
        category: category,
        courseDuration: duration,
        courseLessons: lessons,
        status: "Sent",
        createdAt: DateTime.now().microsecondsSinceEpoch.toString(),
        fcmToken: uploader.fcmToken,
        uploaderId: uploader.id,
        uploaderName: uploader.name,
        courseFee: amount,
        uploaderPicUrl: uploader.profilePicUrl);

    // send data in firestore
    final isUploaded =
        await FirestoreSkillsOfferedRepo.uploadCourseDetails(skillOffered);

    // uploaded
    if (isUploaded) {
      // we can cache here asw but i am leaving this for another screen where user will be able to view list of all their uploaded courses
      Utils.toastMsg(
          title: title,
          description: "Your Course has been uplaoded sucessfully",
          type: ToastificationType.success);
      Utils.cancelLoading(context);
      AppNavigator.navigateBack(context);
    }
    // not uplaoded
    else {
      Utils.toastMsg(
          title: title,
          description: "Your Course has not been uplaoded.",
          type: ToastificationType.error);
    }

    // close progress indicator
    Utils.cancelLoading(context);
  }
}
