import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skility_x/constants/app_keys/drop_down_keys.dart';
import 'package:skility_x/constants/app_keys/text_controller_keys.dart';
import 'package:skility_x/models/Users/users.dart';
import 'package:skility_x/view-model/data_providers/view/widgets/drop_down_list.dart';
import 'package:skility_x/view-model/data_providers/view/widgets/text_controllers.dart';

final userModelDi = StateNotifierProvider<_UserModelNotifier, Users>((ref) {
  return _UserModelNotifier();
});

class _UserModelNotifier extends StateNotifier<Users> {
  _UserModelNotifier()
      : super(Users(
            id: '',
            name: '',
            email: '',
            bio: '',
            mainSkill: '',
            SkillsOffered: [],
            skillsToLearn: [],
            gpsLocation: '',
            fcmToken: '',
            profilePicUrl: '',
            coverPhotoUrl: '',
            gender: '',
            activeStatus: false)) {
    _initData();
  }

  Future<void> _initData() async {}

  void updateTextDetails(WidgetRef ref) {
    final String name =
        ref.read(controllerTextProvider(TextControllerKeys.nameKey));

    final String email =
        ref.read(controllerTextProvider(TextControllerKeys.emailKey));

    //dropdowns from dropdwon
    final String gender =
        ref.read(formValuesProvider.notifier).getValue(DropDownKeys.genders);

    final String skill = ref
        .read(formValuesProvider.notifier)
        .getValue(DropDownKeys.searchSkills);

    state = state.copyWith(
        name: name, email: email, gender: gender, mainSkill: skill);

    debugPrint(state.name);
    debugPrint(state.email);
    debugPrint(state.gender);
    debugPrint(state.mainSkill);
  }

  void updatePicture(String url) {
    state = state.copyWith(profilePicUrl: url);
  }
}
