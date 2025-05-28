import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skility_x/core/config/dep_injection/user_model.dart';
import 'package:skility_x/core/utils.dart/utils.dart';
import 'package:skility_x/data_source/repository/firestore/firestore_skills_requests_repo.dart';
import 'package:skility_x/models/SkillsRequests/skills_requests.dart';
import 'package:toastification/toastification.dart';

class RequestsReceivedAction {
  // accept user requies and make changes in doc

  static Future<bool> acceptRequest(
      BuildContext context, WidgetRef ref, SkillsRequests reqDoc) async {
    // make required changes in the doc
    SkillsRequests request = reqDoc.copyWith(
        status: 'Accepted', fcmToken: ref.read(userModelDi).fcmToken);

    final isSend = await FirestoreSkillsRequestsRepo.acceptRequest(request);

    if (isSend) {
      Utils.toastMsg(
          title: 'Request Accepted',
          description: 'You have accepted the request.',
          type: ToastificationType.success);
    } else {
      Utils.toastMsg(
          title: 'Request Failed',
          description: 'Faield to accept the request.',
          type: ToastificationType.error);
    }

    return isSend;
  }
}
