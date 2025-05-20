import 'package:hive/hive.dart';
import 'package:skility_x/constants/app_keys/hive_box_keys.dart';
import 'package:skility_x/models/Users/users.dart';

class HiveUserDataService {
  static Future<Box<Users>> _openBox() async {
    if (Hive.isBoxOpen(HiveKeys.user_hive)) {
      return await Hive.box<Users>(HiveKeys.user_hive);
    }
    return await Hive.openBox<Users>(HiveKeys.user_hive);
  }

  static Future<void> saveUserData(Users user) async {
    final box = await _openBox();

    await box.put(user.id, user);
  }

  static Future<void> updateuserData(Users user) async {
    final box = await _openBox();

    await box.put(user.id, user);
  }

  static Future<Users?> getUserData(String key) async {
    final box = await _openBox();

    return await box.get(key);
  }
}
