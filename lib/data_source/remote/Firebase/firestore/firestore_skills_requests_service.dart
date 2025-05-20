import 'package:skility_x/constants/app_keys/firestore_collection_keys.dart';
import 'package:skility_x/data_source/remote/Firebase/firebase_manager.dart';
import 'package:skility_x/models/SkillsRequests/skills_requests.dart';

class FirestoreSkillsRequestService {
  static Future<void> uploadRequestDetails(SkillsRequests skillsReq) async {
    final collection = FirebaseManager.firestore
        .collection(FirestoreCollectionKeys.skills_rrquests);

    final docRef = collection.doc();
    final id = docRef.id;

    final skillsReqWithId = skillsReq.copyWith(requestId: id);

    await docRef.set(skillsReqWithId.toJson());
  }

  static Future<List<SkillsRequests>> getAllSentRequests(String key) async {
    final docList = await FirebaseManager.firestore
        .collection(FirestoreCollectionKeys.skills_rrquests)
        .where('fromUserId', isEqualTo: key)
        .get();

    final data =
        docList.docs.map((map) => SkillsRequests.fromJson(map.data())).toList();

    return data;
  }

  static Future<List<SkillsRequests>> getAllReceivedRequests(String key) async {
    final docList = await FirebaseManager.firestore
        .collection(FirestoreCollectionKeys.skills_rrquests)
        .where('toUserId', isEqualTo: key)
        .get();

    final data =
        docList.docs.map((map) => SkillsRequests.fromJson(map.data())).toList();

    return data;
  }
}
