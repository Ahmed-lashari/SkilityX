import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skility_x/constants/app_keys/text_controller_keys.dart';
import 'package:skility_x/core/config/dep_injection/user_model.dart';
import 'package:skility_x/core/config/route_config.dart';
import 'package:skility_x/core/utils.dart/utils.dart';
import 'package:skility_x/core/utils.dart/validators.dart';
import 'package:skility_x/data_source/remote/Firebase/cloud_messaging/send_notification_service.dart';
import 'package:skility_x/data_source/repository/firestore/firestore_skills_requests_repo.dart';
import 'package:skility_x/models/SkillsOffered/skills_offered.dart';
import 'package:skility_x/models/SkillsRequests/skills_requests.dart';
import 'package:skility_x/view-model/data_providers/view/widgets/text_controllers.dart';
import 'package:toastification/toastification.dart';

class SkillsRequestdAction {
  static Future<void> sendRequest(BuildContext context, WidgetRef ref,
      GlobalKey<FormState> formKey, SkillsOffered doc) async {
    if (!Validators.validateForm(formKey)) return;

// displayes loading
    Utils.showLoading(context);
    final user = ref.read(userModelDi);

    final description =
        ref.read(controllerTextProvider(TextControllerKeys.description));

    SkillsRequests skillsRequests = SkillsRequests(
        requestId: '',
        fromUserId: user.id,
        toUserId: doc.uploaderId,
        skillsOffered: doc.category,
        message: description,
        status: 'Sent',
        createdAt: DateTime.now().microsecondsSinceEpoch.toString(),
        senderName: user.name,
        receiverName: doc.uploaderName,
        senderMainSkill: user.mainSkill,
        senderContactNumber: user.email,
        fcmToken: user.fcmToken,
        senderPicUrl: user.profilePicUrl,
        receiverPicUrl: doc.uploaderPicUrl,
        courseDuration: doc.courseDuration,
        courseLessons: doc.courseLessons,
        receiverMainName: doc.uploaderName);

    final isUploaded =
        await FirestoreSkillsRequestsRepo.uploadRequestDetails(skillsRequests);

    if (isUploaded) {
      Utils.toastMsg(
          title: "Request Sent",
          description:
              "Your Request has been successfully sent to ${doc.uploaderName}",
          type: ToastificationType.success);
      AppNavigator.navigateBack(context);
      Utils.cancelLoading(context);

      // after that send a notification to the receiveing user as well.

      await SendNotificationService.sendNotificationUsingApi(
          fcmTokenOfReceiver: doc.fcmToken,
          data: {},
          title: "Learning Request Received",
          body:
              '${user.name} has requested to learn your course: ${doc.title}.');
    } else {
      Utils.toastMsg(
          title: "Request Failed",
          description: "Your Request has not been sent to ${doc.uploaderName}",
          type: ToastificationType.warning);
    }

// calcles loading
    Utils.cancelLoading(context);
  }
}
