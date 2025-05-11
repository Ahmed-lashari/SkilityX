// providers.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skility_x/constants/app_keys/drop_down_keys.dart';

final dropdownItemsProvider =
    Provider.autoDispose.family<List<String>, String>((ref, key) {
  switch (key) {
    case DropDownKeys.genders:
      return ['Female', 'Male', 'Other'];

    case DropDownKeys.searchSkills:
      final skills = [
        'Mathematics',
        'History',
        'Language',
        'Science',
        'Music',
        'Painting',
        'Photography / Editing',
        'Videography / Editing',
        'Arabic',
        'Chinese',
        'English',
        'Urdu',
        'Japanese',
        'Hindi',
        'Artificial Intelligence',
        'App - Development',
        'Web - Development',
        'Cyber Security',
        'Robotics',
        'UI / UX',
      ];
      skills.sort();
      return skills;
    default:
      return [];
  }
});

// holds the drop dwon selected values
class _FormValuesNotifier extends StateNotifier<Map<String, String?>> {
  _FormValuesNotifier() : super({});

  void setValue(String key, String? value) {
    state = {
      ...state,
      key: value,
    };
  }

  String? getValue(String key) => state[key];
}

final formValuesProvider =
    StateNotifierProvider<_FormValuesNotifier, Map<String, String?>>(
  (ref) => _FormValuesNotifier(),
);
