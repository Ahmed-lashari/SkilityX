import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skility_x/core/utils.dart/paginations.dart';
import 'package:skility_x/data_source/repository/firestore/firestore_skills_requests_repo.dart';
import 'package:skility_x/models/SkillsRequests/skills_requests.dart';

final receivedRequestsPaginationProvider = StateNotifierProvider.family<
    _SentRequestsPaginationNotifier,
    ReceivedPaginationState,
    String>((ref, userId) {
  return _SentRequestsPaginationNotifier(userId);
});

class _SentRequestsPaginationNotifier
    extends StateNotifier<ReceivedPaginationState> {
  final String userId;

  _SentRequestsPaginationNotifier(this.userId)
      : super(ReceivedPaginationState(
          items: [],
          hasMoreData: true,
          isLoading: false,
        )) {
    // init automatic load
    loadMore();
  }

  Future<void> loadMore() async {
    if (state.isLoading || !state.hasMoreData) return;

    state = ReceivedPaginationState(
      items: state.items,
      hasMoreData: state.hasMoreData,
      isLoading: true,
    );

    SkillsRequests? lastDoc;
    if (state.items.isNotEmpty) {
      lastDoc = state.items.last;
    }

    final newItems = await FirestoreSkillsRequestsRepo.getAllReceivedRequests(
      userId,
      lastDocument: lastDoc,
    );

    final hasMore = newItems.length >= 1;
    final updatedItems = [...state.items, ...newItems];

    state = ReceivedPaginationState(
      items: updatedItems,
      hasMoreData: hasMore,
      isLoading: false,
    );
  }
}
