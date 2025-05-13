// import 'dart:async';

import 'package:flutter/material.dart';
import 'package:skility_x/constants/app_colors.dart';
// import 'package:skility_x/core/config/route_config.dart';
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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
              spacing: 30,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset('assets/skility_x_icon/skility_x.png', scale: 13),
                Text(
                  "SkilityX",
                  style: TextStyle(
                      fontSize: 40,
                      color: AppColors.secondary,
                      fontWeight: FontWeight.bold),
                )
              ])
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();

    // Timer(
    //     Duration(seconds: 1),
    //     () => AppNavigator.navigateTo(context,
    //         sRoute: RouteEnum.authScreen.path));
  }
}
