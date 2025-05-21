import 'package:skility_x/core/utils.dart/utils.dart';
import 'package:skility_x/data_source/remote/Firebase/firestore/firestore_skills_requests_service.dart';
import 'package:skility_x/models/SkillsRequests/skills_requests.dart';

class FirestoreSkillsRequestsRepo {
  static Future<bool> uploadRequestDetails(SkillsRequests skillsReq) async {
    try {
      await FirestoreSkillsRequestService.uploadRequestDetails(skillsReq);
      return true;
    } catch (e, h) {
      Utils.handleError(e.toString(), h);
      return false;
    }
  }

  static Future<List<SkillsRequests>> getAllSentRequests(
    String key, {
    SkillsRequests? lastDocument,
  }) async {
    try {
      return await FirestoreSkillsRequestService.getAllSentRequests(
        key,
        lastDocument: lastDocument,
      );
    } catch (e, h) {
      Utils.handleError(e.toString(), h);
      return [];
    }
  }

  static Future<List<SkillsRequests>> getAllReceivedRequests(
    String key, {
    SkillsRequests? lastDocument,
  }) async {
    try {
      return await FirestoreSkillsRequestService.getAllReceivedRequests(
        key,
        lastDocument: lastDocument,
      );
    } catch (e, h) {
      Utils.handleError(e.toString(), h);
      return [];
    }
  }
}
