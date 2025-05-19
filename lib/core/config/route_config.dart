import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:skility_x/view/screens/auth/auth_screen.dart';
import 'package:skility_x/view/screens/home/1_skills/2_filter_menu.dart';
import 'package:skility_x/view/screens/splash/splash.dart';

enum RouteEnum { splash, authScreen, filterMenu }

extension RouteEnumExtension on RouteEnum {
  String get path {
    switch (this) {
      case RouteEnum.splash:
        return "/";
      case RouteEnum.authScreen:
        return "/loginScreen";
      // case RouteEnum.homeScreen:
      //   return "/homeScreen";
      case RouteEnum.filterMenu:
        return "/filterMenu";
    }
  }
}

final appRoutes = {
  RouteEnum.splash.path: (context) => SplashScreen(),
  RouteEnum.authScreen.path: (context) => AuthScreen(),
  // RouteEnum.homeScreen.path: (context) => HomeTabs(),
  RouteEnum.filterMenu.path: (context) => FilterSkills(),
};

class AppNavigator {
  static Future navigateTo(BuildContext context,
      {String? sRoute, Widget? wRoute}) async {
    try {
      if (sRoute != null) {
        await Navigator.pushNamed(context, sRoute);
      } else {
        await Navigator.push(
            context, MaterialPageRoute(builder: (context) => wRoute!));
      }
    } catch (e) {
      log('error in changing the screen');
    }
  }

  static void navigateBack(BuildContext context) {
    Navigator.pop(context);
  }

  static Future<void> startAsInitial(BuildContext context,
      {String? stringRoute, Widget? widgetRoute}) async {
    try {
      if (stringRoute != null) {
        await Navigator.pushNamedAndRemoveUntil(
            context, stringRoute, (Route<dynamic> route) => false);
      } else {
        await Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => widgetRoute!),
            (Route<dynamic> route) => false);
      }
    } catch (e) {
      log('error in changing the screen to initial');
    }
  }
}
