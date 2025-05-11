import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final focusNodeProvider =
    Provider.autoDispose.family<FocusNode, String>((ref, key) {
  final focusNode = FocusNode();
  ref.onDispose(() {
    focusNode.dispose();
    debugPrint("Proivder disposed for key: $key");
  });
  debugPrint("Proivder Created for key: $key");

  return focusNode;
});
