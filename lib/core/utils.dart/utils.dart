import 'package:flutter/material.dart';

class Utils {
  static double getHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  static double getWeidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }
}
