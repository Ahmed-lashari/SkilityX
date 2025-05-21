import 'package:skility_x/core/utils.dart/utils.dart';
import 'package:skility_x/data_source/remote/Firebase/firestore/firestore_user_data_service.dart';
import 'package:skility_x/models/Users/users.dart';

class FirestoreUserDataRepo {
  static Future<Users?> saveUserData(Users user, String credId) async {
    try {
      final userWithid =
          await FirestoreUserDataService.saveUserData(user, credId);

      return userWithid;
    } catch (e, h) {
      Utils.handleError(e.toString(), h);

      throw ("RETURNING NULL FROM THE lib/data_source/repository/firestore/user_data_service.dart");
    }
  }

  static Future<bool> updateUserData(Users user) async {
    try {
      await FirestoreUserDataService.updateUserData(user);

      return true;
    } catch (e, h) {
      Utils.handleError(e.toString(), h);

      return false;
    }
  }

  static Future<Users?> getUserDataById(String userId) async {
    Users? user;
    try {
      user = await FirestoreUserDataService.getUserDataById(userId);
    } catch (e, h) {
      Utils.handleError(e.toString(), h);
    } finally {
      return user;
    }
  }

  static Future<bool> updateCoverPhotos(Users user, String url) async {
    try {
      final userWithCoverPhoto = user.copyWith(coverPhotoUrl: url);
      await FirestoreUserDataService.updateCoverPhoto(userWithCoverPhoto);
      return true;
    } catch (e, h) {
      Utils.handleError(e.toString(), h);
      return false;
    }
  }
}
