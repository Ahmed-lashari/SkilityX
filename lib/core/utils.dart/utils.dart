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

  static String getWelcomeText() {
    final now = DateTime.now();
    final int currentMinutes = now.hour * 60 + now.minute;

    final int morningStart = 5 * 60 + 1; // 5:01 AM
    final int morningEnd = 11 * 60 + 59; // 11:59 AM

    final int afternoonStart = 12 * 60; // 12:00 PM
    final int afternoonEnd = 17 * 60 + 30; // 5:30 PM

    final int eveningStart = 17 * 60 + 31; // 5:31 PM
    final int eveningEnd = 19 * 60; // 7:00 PM

    if (currentMinutes >= morningStart && currentMinutes <= morningEnd) {
      return "Good Morning ☀️";
    } else if (currentMinutes >= afternoonStart &&
        currentMinutes <= afternoonEnd) {
      return "Nice Afternoon 🌤️";
    } else if (currentMinutes >= eveningStart && currentMinutes <= eveningEnd) {
      return "Chill Evening 🌇";
    } else {
      return "Sweet Night 🌙";
    }
  }
}
