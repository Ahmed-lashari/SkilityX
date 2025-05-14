import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final filterCategoryProvider =
    StateNotifierProvider<_FilterCategoryNotifier, bool>((ref) {
  return _FilterCategoryNotifier();
});

class _FilterCategoryNotifier extends StateNotifier<bool> {
  _FilterCategoryNotifier() : super(true);

  bool get getState => state;

  void indexTo0Login() => state = false;

  void indexTo1Signup() => state = true;
}

final filterPageController =
    StateNotifierProvider<_FilterPageNotifier, PageController>((ref) {
  return _FilterPageNotifier();
});

class _FilterPageNotifier extends StateNotifier<PageController> {
  _FilterPageNotifier() : super(PageController());

  void onPageChanged(int index, WidgetRef ref, bool isCLisked) {
    if (index == 0) {
      ref.read(filterCategoryProvider.notifier).indexTo1Signup();
      if (isCLisked) {
        state.animateToPage(0,
            duration: const Duration(milliseconds: 300), curve: Curves.linear);
      }
    } else {
      ref.read(filterCategoryProvider.notifier).indexTo0Login();
      if (isCLisked) {
        state.animateToPage(1,
            duration: const Duration(milliseconds: 300), curve: Curves.linear);
      }
    }
  }
}
