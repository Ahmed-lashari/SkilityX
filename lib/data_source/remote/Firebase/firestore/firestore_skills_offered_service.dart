import 'package:skility_x/constants/app_keys/firestore_collection_keys.dart';
import 'package:skility_x/data_source/remote/Firebase/firebase_manager.dart';
import 'package:skility_x/models/SkillsOffered/skills_offered.dart';

class FirestoreSkillsOfferedService {
  static Future<void> uploadCourseDetails(SkillsOffered skillsOffered) async {
    final collection = FirebaseManager.firestore
        .collection(FirestoreCollectionKeys.skills_offered);

    final docRef = collection.doc();
    final id = docRef.id;

    final skillsOfferedWithId = skillsOffered.copyWith(id: id);

    await docRef.set(skillsOfferedWithId.toJson());
  }

  static Future<List<SkillsOffered>> getFilteredCoursesList(String key) async {
    final docList = await FirebaseManager.firestore
        .collection(FirestoreCollectionKeys.skills_offered)
        .where('category', isEqualTo: key)
        .get();

    final data =
        docList.docs.map((map) => SkillsOffered.fromJson(map.data())).toList();

    return data;
  }
}
