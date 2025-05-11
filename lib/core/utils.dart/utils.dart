import 'package:flutter/material.dart';
import 'package:skility_x/view/widgets/custom_scaffold.dart';

class Utils {
  static double getHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  static double getWeidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  static void openDrawer(GlobalKey<CustomScaffoldState> scaffoldKey) {
    scaffoldKey.currentState?.openDrawer();
  }

  static void closeDrawer(GlobalKey<CustomScaffoldState> scaffoldKey) {
    scaffoldKey.currentState?.closeDrawer();
  }
}
