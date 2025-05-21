import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:skility_x/data_source/repository/firestore/firestore_skills_requests_repo.dart';
import 'package:skility_x/models/SkillsRequests/skills_requests.dart';

final receivedRequestProvider =
    FutureProvider.family<List<SkillsRequests>, String>((ref, key) async {
  return await FirestoreSkillsRequestsRepo.getAllReceivedRequests(key);
});
