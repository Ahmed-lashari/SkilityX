import 'package:flutter/material.dart';
import 'package:skility_x/core/config/route_config.dart';
import 'package:skility_x/core/utils.dart/utils.dart';
import 'package:skility_x/view/screens/home/1_skills/3_filter_screen.dart';
import 'package:skility_x/view/widgets/image_ui.dart';

class CategoryCard extends StatelessWidget {
  final String icon;
  final String label;
  final Color backgroundColor;
  final Color iconColor;

  const CategoryCard({
    required this.icon,
    required this.label,
    required this.backgroundColor,
    required this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: InkWell(
        splashColor: iconColor.withAlpha(100),
        onTap: () => AppNavigator.navigateTo(context,
            wRoute: FilterScreen(skillKey: label, color: iconColor)),
        borderRadius: BorderRadius.circular(16),
        child: Ink(
          height: Utils.getHeight(context) * 0.2,
          width: Utils.getHeight(context) * 0.2,
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                  child: CustomIcon(
                      icon: icon, color: iconColor, height: 45, width: 45)),
              Text(
                label,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: iconColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
