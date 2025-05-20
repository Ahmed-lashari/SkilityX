import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skility_x/core/config/dep_injection/user_model.dart';
import 'package:skility_x/core/utils.dart/utils.dart';
import 'package:skility_x/data_source/local/Hive/user_data.dart';
import 'package:skility_x/models/Users/users.dart';

class HiveuserDataRepo {
  static Future<bool> saveUserData(Users user, WidgetRef ref) async {
    ref.read(userModelDi.notifier).updateState(user);
    try {
      await HiveUserDataService.saveUserData(user);
      return true;
    } catch (e, h) {
      Utils.handleError(e.toString(), h);
      return false;
    }
  }

  static Future<bool> updateUserData(Users user) async {
    try {
      await HiveUserDataService.updateuserData(user);
      return true;
    } catch (e, h) {
      Utils.handleError(e.toString(), h);
      return false;
    }
  }

  static Future<Users?> getUserData(String key) async {
    try {
      return await HiveUserDataService.getUserData(key);
    } catch (e, h) {
      Utils.handleError(e.toString(), h);
      return null;
    }
  }
}
