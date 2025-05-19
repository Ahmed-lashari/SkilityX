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
        // acadedmic
        'Mathematics',
        'History',
        'Language',
        'Science',

        //artistic
        'Music',
        'Dancing',
        'Painting',
        'Photography',
        'Videography',

        // languages
        'Arabic',
        'Chinese',
        'English',
        'Urdu',
        'Japanese',
        'Hindi',

        // technical
        'AI',
        'App - Dev',
        'Web - Dev',
        'Cyber Security',
        'UI / UX',
        'Robotics',
      ];
      skills.sort();
      return skills;

    case DropDownKeys.lessonsKey:
      return [
        "1 - 5",
        "5 - 10",
        "10 - 15",
        "15 - 20",
        "20 - 25",
        "25 - 30",
        "30 - 35",
        "35 - 40",
        "45 >",
      ];
    case DropDownKeys.durationKey:
      return [
        "1 - 5",
        "5 - 10",
        "10 - 15",
        "15 - 20",
        "20 - 25",
        "25 - 30",
        "30 - 35",
        "35 - 40",
        "45 >",
      ];
    case DropDownKeys.amountKey:
      return [
        "500 - 1k",
        "1k - 5k",
        "5k - 10k",
        "10k - 20k",
        "20k - 35k",
        "35k - 50k",
        "50k >",
      ];

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

  String getValue(String key) => (state[key] ?? '').trim();
}

final formValuesProvider =
    StateNotifierProvider<_FormValuesNotifier, Map<String, String?>>(
  (ref) => _FormValuesNotifier(),
);
