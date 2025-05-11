import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skility_x/constants/app-icons.dart';
import 'package:skility_x/constants/app_keys/text_controller_keys.dart';
import 'package:skility_x/core/utils.dart/utils.dart';
import 'package:skility_x/view/widgets/app_textfield.dart';
import 'package:skility_x/view/widgets/bottom_nav_bar.dart';
import 'package:skility_x/view/widgets/custom_scaffold.dart';

AppBar myAppBar({
  required final GlobalKey<CustomScaffoldState> persistentkey,
  List<Widget>? actions,
  required BuildContext context,
}) {
  return AppBar(
    automaticallyImplyLeading: false,
    actions: actions,
    toolbarHeight: Utils.getHeight(context) * 0.1,
    centerTitle: false,
    title: Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Consumer(builder: (context, ref, _) {
        final selectedIndex = ref.watch(selectedIndexProvider);

        if (selectedIndex == 0) {
          return myTextField(
              prefixIcon: AppStaticIcons.search,
              contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 0),
              hintText: 'Search Skills...',
              controllerKey: TextControllerKeys.searchSkills);
        } else if (selectedIndex == 1) {
          return Text('Collabration Requests');
        } else {
          return Text('Muhammad Ahmed Lashari');
        }
      }),
    ),
  );
}
