import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skility_x/constants/app_colors.dart';
import 'package:skility_x/core/utils.dart/utils.dart';
import 'package:skility_x/view-model/ui_providers/view/screen/auth/toggle_button.dart';
import 'package:skility_x/view/themes/theme_conts/typography.dart';

class ToggleFilterButton extends ConsumerWidget {
  const ToggleFilterButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
        width: Utils.getWeidth(context) * 0.8,
        height: 50,
        decoration: BoxDecoration(
            color: AppColors.bottomNavBackground,
            borderRadius: BorderRadius.circular(50)),
        child: Stack(children: [
          Consumer(builder: (context, ref, _) {
            final isPopularSelected = ref.watch(filterCategoryProvider);
            return AnimatedAlign(
                duration: Duration(milliseconds: 300),
                curve: Curves.easeInOut,
                alignment: isPopularSelected
                    ? Alignment.centerLeft
                    : Alignment.centerRight,
                child: Container(
                    margin:
                        EdgeInsets.only(left: 2, right: 2, top: 2, bottom: 2),
                    width: Utils.getWeidth(context) * 0.4,
                    decoration: BoxDecoration(
                        color: AppColors.selectedItemIcon,
                        borderRadius: BorderRadius.circular(50))));
          }),
          Row(children: [
            _buildToggleButton(context, ref, true),
            _buildToggleButton(context, ref, false)
          ])
        ]));
  }

  Widget _buildToggleButton(
      BuildContext context, WidgetRef ref, bool isPopular) {
    debugPrint('building toggle');
    return GestureDetector(
        onTap: () => ref
            .read(filterPageController.notifier)
            .onPageChanged(isPopular ? 0 : 1, ref, true),
        child: Container(
            width: Utils.getWeidth(context) * 0.40,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: AppColors.transparent),
            child: _TextBuilder(isPopular: isPopular)));
  }
}

// only rebuilds when relevant state changes
class _TextBuilder extends StatelessWidget {
  final bool isPopular;

  const _TextBuilder({required this.isPopular});

  @override
  Widget build(BuildContext context) {
    debugPrint('building whole text');

    return AnimatedDefaultTextStyle(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        style: TextStyle(
            fontSize: 14,
            color: AppColors.onBackground,
            fontFamily: AppTypography.interMedium),
        child: Text(isPopular ? "Login" : "Register"));
  }
}
