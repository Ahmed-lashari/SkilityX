import 'package:flutter/material.dart';
import 'package:skility_x/view/ui_config/widgets/bottom_nav_bar.dart';
import 'package:skility_x/view/widgets/bottom_nav_bar.dart';

class HomeTabs extends StatefulWidget {
  const HomeTabs({super.key});

  @override
  State<HomeTabs> createState() => _HomeTabsState();
}

class _HomeTabsState extends State<HomeTabs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [_buildBodyWidgets(), _buildBottomnavBar()],
      ),
    );
  }

  Widget _buildBodyWidgets() {
    return Positioned.fill(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Text('Your Screen Content'),
            Text('Your Screen Content'),
            Text('Your Screen Content'),
            Text('Your Screen Content'),
            Text('Your Screen Content'),
            Text('Your Screen Content'),
            Text('Your Screen Content'),
            Text('Your Screen Content'),
            Text('Your Screen Content'),
            Text('Your Screen Content'),
            Text('Your Screen Content'),
            Text('Your Screen Content'),
            Text('Your Screen Content'),
            Text('Your Screen Content'),
            Text('Your Screen Content'),
            Text('Your Screen Content'),
            Text('Your Screen Content'),
            Text('Your Screen Content'),
            Text('Your Screen Content'),
            Text('Your Screen Content'),
            Text('Your Screen Content'),
            Text('Your Screen Content'),
            Text('Your Screen Content'),
            Text('Your Screen Content'),
            Text('Your Screen Content'),
            Text('Your Screen Content'),
            Text('Your Screen Content'),
            Text('Your Screen Content'),
            Text('Your Screen Content'),
            Text('Your Screen Content'),
            Text('Your Screen Content'),
            Text('Your Screen Content'),
            Text('Your Screen Content'),
            Text('Your Screen Content'),
            Text('Your Screen Content'),
            Text('Your Screen Content'),
            Text('Your Screen Content'),
            Text('Your Screen Content'),
            Text('Your Screen Content'),
            Text('Your Screen Content'),
            Text('Your Screen Content'),
            Text('Your Screen Content'),
            Text('Your Screen Content'),
            Text('Your Screen Content'),
            Text('Your Screen Content'),
            Text('Your Screen Content'),
            Text('Your Screen Content'),
            Text('Your Screen Content'),
            Text('Your Screen Content'),
            Text('Your Screen Content'),
            Text('Your Screen Content'),
            Text('Your Screen Content'),
            Text('Your Screen Content'),
            Text('Your Screen Content'),
            Text('Your Screen Content'),
            Text('Your Screen Content'),
            Text('Your Screen Content'),
            Text('Your Screen Content'),
            Text('Your Screen Content'),
            Text('Your Screen Content'),
            Text('Your Screen Content'),
            Text('Your Screen Content'),
            Text('Your Screen Content'),
            Text('Your Screen Content'),
            Text('Your Screen Content'),
            Text('Your Screen Content'),
            Text('Your Screen Content'),
            Text('Your Screen Content'),
            Text('Your Screen Content'),
            Text('Your Screen Content'),
            Text('Your Screen Content'),
            Text('Your Screen Content'),
            Text('Your Screen Content'),
            Text('Your Screen Content'),
            Text('Your Screen Content'),
            Text('Your Screen Content'),
            Text('Your Screen Content'),
            Text('Your Screen Content'),
            Text('Your Screen Content'),
            Text('Your Screen Content'),
            Text('Your Screen Content'),
            Text('Your Screen Content'),
            Text('Your Screen Content'),
            Text('Your Screen Content'),
            Text('Your Screen Content'),
            Text('Your Screen Content'),
            Text('Your Screen Content'),
            Text('Your Screen Content'),
            Text('Your Screen Content'),
            Text('Your Screen Content'),
            Text('Your Screen Content'),
            Text('Your Screen Content'),
            Text('Your Screen Content'),
            Text('Your Screen Content'),
            Text('Your Screen Content'),
            Text('Your Screen Content'),
          ],
        ),
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
          BottomNavItem(icon: Icons.home, label: "Skill offers"),
          BottomNavItem(icon: Icons.search, label: "Skill Requests"),
          BottomNavItem(icon: Icons.message, label: "Reviewes"),
        ],
        onItemSelected: (index) {
          // Handle tab switch
        },
      ),
    );
  }
}
