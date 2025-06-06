import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skility_x/constants/app-icons.dart';
import 'package:skility_x/constants/app_keys/text_controller_keys.dart';
import 'package:skility_x/core/utils.dart/utils.dart';
import 'package:skility_x/models/Users/users.dart';
import 'package:skility_x/view/widgets/app_textfield.dart';
import 'package:skility_x/view/widgets/bottom_nav_bar.dart';
import 'package:skility_x/view/widgets/custom_widgets.dart';

AppBar myAppBar({
  List<Widget>? actions,
  Widget? title,
  bool showLeading = false,
  Users? user,
  required BuildContext context,
}) {
  return AppBar(
    automaticallyImplyLeading: false,
    actions: actions,
    toolbarHeight: !showLeading ? Utils.getHeight(context) * 0.1 : null,
    centerTitle: false,
    leading: showLeading
        ? CustomWidgets.backNavigationIconButt(context: context)
        : null,
    title: title ??
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Consumer(builder: (context, ref, _) {
            final selectedIndex = ref.watch(selectedIndexProvider);

            if (selectedIndex == 0) {
              return myTextField(
                  prefixIcon: AppStaticIcons.search,
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                  hintText: 'Search Skills...',
                  controllerKey: TextControllerKeys.searchSkills);
            } else if (selectedIndex == 1) {
              return Text('Request Portal');
            } else {
              return CustomWidgets.AppBarWelcom(user!);
            }
          }),
        ),
  );
}
