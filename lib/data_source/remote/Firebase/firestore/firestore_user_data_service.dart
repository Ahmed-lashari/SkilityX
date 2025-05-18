import 'package:skility_x/constants/app_keys/firestore_collection_keys.dart';
import 'package:skility_x/data_source/remote/Firebase/firebase_manager.dart';
import 'package:skility_x/data_source/repository/cloud_messaging/notigication_repo.dart';
import 'package:skility_x/models/Users/users.dart';

class FirestoreUserDataService {
  static Future<Users> saveUserData(Users user, String credId) async {
    final collection =
        FirebaseManager.firestore.collection(FirestoreCollectionKeys.users);

    final docRef = collection.doc(credId);

    final token = await NotificationRepo.getFcmToken() ?? '';

    final userWithId = await user.copyWith(id: credId, fcmToken: token);
    await docRef.set(userWithId.toJson());

    return userWithId;
  }

  static Future<Users?> getUserDataById(String userId) async {
    final docRef = FirebaseManager.firestore
        .collection(FirestoreCollectionKeys.users)
        .doc(userId);

    final snapshot = await docRef.get();

    if (snapshot.exists) {
      final data = snapshot.data();
      if (data != null) {
        return Users.fromJson(data);
      }
    }

    return null;
  }
}
