import 'package:skility_x/core/utils.dart/utils.dart';
import 'package:skility_x/data_source/remote/Firebase/firestore/firestore_skills_offered_service.dart';
import 'package:skility_x/models/SkillsOffered/skills_offered.dart';

class FirestoreSkillsOfferedRepo {
  static Future<bool> uploadCourseDetails(SkillsOffered skillsOffered) async {
    try {
      await FirestoreSkillsOfferedService.uploadCourseDetails(skillsOffered);
      return true;
    } catch (e, h) {
      Utils.handleError(e.toString(), h);
      return false;
    }
  }
}
