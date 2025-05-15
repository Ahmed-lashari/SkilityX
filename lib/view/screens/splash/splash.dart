import 'dart:async';
import 'package:flutter/material.dart';
import 'package:skility_x/constants/app-icons.dart';
import 'package:skility_x/core/config/route_config.dart';
import 'package:skility_x/view/widgets/custom_scaffold.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: Center(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox.shrink(),
            Image.asset(AppImageIcons.appLogo, scale: 13),
            Text("by: Muhammad Ahmed Lashari", style: TextStyle(fontSize: 20))
          ],
        ),
      )),
    );
  }

  @override
  void initState() {
    super.initState();

    Timer(
        Duration(seconds: 1),
        () => AppNavigator.navigateTo(context,
            sRoute: RouteEnum.authScreen.path));
  }
}
