import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final assetCheckProvider =
    FutureProvider.family<bool, String>((ref, assetPath) async {
  try {
    await rootBundle.load(assetPath);
    return true;
  } catch (e) {
    return false;
  }
});
