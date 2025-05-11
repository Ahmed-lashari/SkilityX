import 'package:flutter/material.dart';
import 'package:skility_x/view/widgets/custom_scaffold.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    debugPrint('building profile screen');
    debugPrint('building skills offers screen');
    return CustomScaffold(
      hPadding: 0,
      isScrollable: true,
      body: Center(
          child: Column(
        children: [],
      )),
    );
  }
}
