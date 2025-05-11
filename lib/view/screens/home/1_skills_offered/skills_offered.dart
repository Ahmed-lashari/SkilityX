import 'package:flutter/material.dart';
import 'package:skility_x/view/widgets/custom_scaffold.dart';

class SkillsScreen extends StatefulWidget {
  const SkillsScreen({super.key});

  @override
  State<SkillsScreen> createState() => _SkillsScreenState();
}

class _SkillsScreenState extends State<SkillsScreen> {
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
