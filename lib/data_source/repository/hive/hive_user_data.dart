import 'package:skility_x/core/utils.dart/utils.dart';
import 'package:skility_x/data_source/local/Hive/user_data.dart';
import 'package:skility_x/models/Users/users.dart';

class HiveuserDataRepo {
  static Future<bool> saveUserData(Users user) async {
    try {
      await HiveUserDataService.saveUserData(user);
      return true;
    } catch (e, h) {
      Utils.handleError(e.toString(), h);
      return false;
    }
  }
}
