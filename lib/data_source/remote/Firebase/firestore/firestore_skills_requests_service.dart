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

  static Future<List<SkillsRequests>> getAllSentRequests(
    String key, {
    SkillsRequests? lastDocument,
  }) async {
    var query = FirebaseManager.firestore
        .collection(FirestoreCollectionKeys.skills_rrquests)
        .where('fromUserId', isEqualTo: key)
        .orderBy('createdAt', descending: true)
        .limit(2);

    // if have a last document start after there
    if (lastDocument != null) {
      final lastDoc = await FirebaseManager.firestore
          .collection(FirestoreCollectionKeys.skills_rrquests)
          .doc(lastDocument.requestId)
          .get();

      if (lastDoc.exists) {
        query = query.startAfterDocument(lastDoc);
      }
    }

    final docList = await query.get();
    final data =
        docList.docs.map((map) => SkillsRequests.fromJson(map.data())).toList();

    return data;
  }

  static Future<List<SkillsRequests>> getAllReceivedRequests(
    String key, {
    SkillsRequests? lastDocument,
  }) async {
    var query = FirebaseManager.firestore
        .collection(FirestoreCollectionKeys.skills_rrquests)
        .where('toUserId', isEqualTo: key)
        .orderBy('createdAt', descending: true)
        .limit(2);

    // if have a last document start after there
    if (lastDocument != null) {
      final lastDoc = await FirebaseManager.firestore
          .collection(FirestoreCollectionKeys.skills_rrquests)
          .doc(lastDocument.requestId)
          .get();

      if (lastDoc.exists) {
        query = query.startAfterDocument(lastDoc);
      }
    }

    final docList = await query.get();
    final data =
        docList.docs.map((map) => SkillsRequests.fromJson(map.data())).toList();

    return data;
  }

  static Future<void> acceptRequest(SkillsRequests req) async {
    await FirebaseManager.firestore
        .collection(FirestoreCollectionKeys.skills_rrquests)
        .doc(req.requestId)
        .update(req.toJson());
  }
}
