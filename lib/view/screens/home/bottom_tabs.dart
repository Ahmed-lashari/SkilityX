import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skility_x/constants/app-icons.dart';
import 'package:skility_x/core/utils.dart/utils.dart';
import 'package:skility_x/models/Users/users.dart';
import 'package:skility_x/view/screens/home/2_request_portal/request_tabs.dart';
import 'package:skility_x/view/screens/home/3_profile/1_user_profile.dart';
import 'package:skility_x/view/screens/home/1_skills/1_skills_offered.dart';
import 'package:skility_x/view/ui_config/view/widgets/bottom_nav_bar.dart';
import 'package:skility_x/view/widgets/app_drawer.dart';
import 'package:skility_x/view/widgets/bottom_nav_bar.dart';
import 'package:skility_x/view/widgets/app_bar.dart';
import 'package:skility_x/view/widgets/custom_scaffold.dart';
import 'package:skility_x/view/widgets/keep_alive_wrapper.dart';

class HomeTabs extends ConsumerStatefulWidget {
  final Users user;
  const HomeTabs({super.key, required this.user});

  @override
  ConsumerState<HomeTabs> createState() => _HomeTabsState();
}

class _HomeTabsState extends ConsumerState<HomeTabs> {
  final GlobalKey<CustomScaffoldState> persistentkey =
      GlobalKey<CustomScaffoldState>();

  List<Widget> screens = [];

  @override
  void initState() {
    super.initState();
    screens = [
      KeepAliveWrapper(child: SkillsScreen(user: widget.user)),
      KeepAliveWrapper(child: mySkills(user: widget.user)),
      KeepAliveWrapper(child: Profile(user: widget.user)),
    ];
  }

  @override
  Widget build(BuildContext context) {
    debugPrint('home nav bar tabs screen');

    return CustomScaffold(
      hPadding: 0,
      key: persistentkey,
      drawer: myDrawer(persistentkey: persistentkey, user: widget.user),
      appBar: myAppBar(
        user: widget.user,
        context: context,
        actions: [
          IconButton(
              onPressed: () => Utils.openDrawer(persistentkey),
              icon: Icon(AppStaticIcons.drawer)),
        ],
      ),
      body: Stack(children: [_buildBodyWidgets(), _buildBottomnavBar()]),
    );
  }

  Widget _buildBodyWidgets() {
    return Positioned.fill(
      child: Stack(
        children: List.generate(screens.length, (index) {
          return Consumer(
            builder: (context, ref, child) {
              final selectedIndex = ref.watch(selectedIndexProvider);
              return Offstage(
                  offstage: selectedIndex != index,
                  child: TickerMode(
                    enabled: selectedIndex == index,
                    child: screens[index],
                  ));
            },
          );
        }),
      ),
    );
  }

  Widget _buildBottomnavBar() {
    return Positioned(
      left: 0,
      right: 0,
      bottom: 0,
      child: CustomBottomNavBar(
        items: [
          BottomNavItem(icon: AppStaticIcons.homeList, label: "Skills"),
          BottomNavItem(icon: AppStaticIcons.skills, label: "Requests"),
          BottomNavItem(icon: AppStaticIcons.user, label: "Profile"),
        ],
        onItemSelected: (index) {
          ref.read(selectedIndexProvider.notifier).state = index;
        },
      ),
    );
  }
}
