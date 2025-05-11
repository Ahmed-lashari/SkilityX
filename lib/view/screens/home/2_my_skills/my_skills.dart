import 'package:flutter/material.dart';
import 'package:skility_x/view/widgets/custom_scaffold.dart';

class mySkills extends StatefulWidget {
  const mySkills({super.key});

  @override
  State<mySkills> createState() => _mySkillsState();
}

class _mySkillsState extends State<mySkills> {
  @override
  Widget build(BuildContext context) {
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
