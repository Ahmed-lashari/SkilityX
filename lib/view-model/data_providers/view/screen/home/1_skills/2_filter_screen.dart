import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skility_x/data_source/repository/firestore/firestore_skills_offered_repo.dart';
import 'package:skility_x/models/SkillsOffered/skills_offered.dart';

final offeredSkillsProvider =
    FutureProvider.family<List<SkillsOffered>, String>((ref, key) async {
  // get list as per the key
  final data = await FirestoreSkillsOfferedRepo.getFilteredCoursesList(key);

  // return values
  return data;
});
