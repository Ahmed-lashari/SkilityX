import 'package:skility_x/models/SkillsRequests/skills_requests.dart';

class PaginationController {
  List<SkillsRequests> items = [];
  bool hasMoreData = true;
  bool isLoading = false;
  SkillsRequests? lastDocument;

  void clear() {
    items = [];
    hasMoreData = true;
    lastDocument = null;
  }

  void addItems(List<SkillsRequests> newItems) {
    if (newItems.isEmpty) {
      hasMoreData = false;
      return;
    }

    items.addAll(newItems);
    lastDocument = items.last;
  }
}

abstract class BasePaginationState {
  List<SkillsRequests> get items;
  bool get hasMore;
  bool get isLoadingg;
}

class ReceivedPaginationState extends BasePaginationState {
  final List<SkillsRequests> items;
  final bool hasMoreData;
  final bool isLoading;

  ReceivedPaginationState({
    required this.items,
    required this.hasMoreData,
    required this.isLoading,
  });

  @override
  bool get hasMore => hasMoreData;

  @override
  bool get isLoadingg => isLoading;
}

class SentPaginationState extends BasePaginationState {
  @override
  final List<SkillsRequests> items;
  final bool hasMoreData;
  final bool isLoading;

  SentPaginationState({
    required this.items,
    required this.hasMoreData,
    required this.isLoading,
  });

  @override
  bool get hasMore => hasMoreData;

  @override
  bool get isLoadingg => isLoading;
}
