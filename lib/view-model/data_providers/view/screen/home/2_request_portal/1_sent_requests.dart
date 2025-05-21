import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skility_x/core/utils.dart/paginations.dart';
import 'package:skility_x/data_source/repository/firestore/firestore_skills_requests_repo.dart';
import 'package:skility_x/models/SkillsRequests/skills_requests.dart';

final sentRequestsPaginationProvider = StateNotifierProvider.family<
    _SentRequestsPaginationNotifier,
    SentPaginationState,
    String>((ref, userId) {
  return _SentRequestsPaginationNotifier(userId);
});

class _SentRequestsPaginationNotifier
    extends StateNotifier<SentPaginationState> {
  final String userId;

  _SentRequestsPaginationNotifier(this.userId)
      : super(SentPaginationState(
          items: [],
          hasMoreData: true,
          isLoading: false,
        )) {
    // init automatic load
    loadMore();
  }

  Future<void> loadMore() async {
    if (state.isLoading || !state.hasMoreData) return;

    state = SentPaginationState(
      items: state.items,
      hasMoreData: state.hasMoreData,
      isLoading: true,
    );

    SkillsRequests? lastDoc;
    if (state.items.isNotEmpty) {
      lastDoc = state.items.last;
    }

    final newItems = await FirestoreSkillsRequestsRepo.getAllSentRequests(
      userId,
      lastDocument: lastDoc,
    );

    final hasMore = newItems.length >= 1;
    final updatedItems = [...state.items, ...newItems];

    state = SentPaginationState(
      items: updatedItems,
      hasMoreData: hasMore,
      isLoading: false,
    );
  }
}
