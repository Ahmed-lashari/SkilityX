import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skility_x/core/config/dep_injection/user_model.dart';
import 'package:skility_x/core/config/route_config.dart';
import 'package:skility_x/core/utils.dart/utils.dart';
import 'package:skility_x/data_source/repository/firestore/firestore_user_data_repo.dart';
import 'package:skility_x/data_source/repository/hive/hive_user_data_repo.dart';
import 'package:skility_x/models/Users/users.dart';
import 'package:toastification/toastification.dart';

class CoverPhotoSettingAction {
  static Future<void> updateCoverPhoto(
      BuildContext context, WidgetRef ref, Users user, String url) async {
    // display laoding progress
    Utils.showLoading(context);
    user = user.copyWith(coverPhotoUrl: url);

    // update in firestore
    final isUpdated = await FirestoreUserDataRepo.updateCoverPhotos(user, url);

    // update in hive asw
    if (isUpdated) {
      final hiveUpdated = await HiveuserDataRepo.updateUserData(user);
      if (hiveUpdated) {
        ref.read(userModelDi.notifier).updateState(user);
        Utils.toastMsg(
            title: "Successfully Updated.", type: ToastificationType.success);
        AppNavigator.navigateBack(context);
      }
    } else {
      Utils.toastMsg(
          title: "Internal Error.",
          description: 'Cover photo is not uodated yet.',
          type: ToastificationType.error);
      AppNavigator.navigateBack(context);
    }
    Utils.cancelLoading(context);
  }
}
