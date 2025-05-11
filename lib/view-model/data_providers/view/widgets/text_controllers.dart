import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final textControllersProvider =
    Provider.autoDispose.family<TextEditingController, String>((ref, key) {
  final controller = TextEditingController();
  ref.onDispose(() {
    controller.dispose();
    debugPrint("Proivder disposed for key: $key");
  });
  debugPrint("Proivder Created for key: $key");

  return controller;
});

final controllerTextProvider =
    Provider.autoDispose.family<String, String>((ref, key) {
  final text = ref.read(textControllersProvider(key)).text;

  return text;
});
