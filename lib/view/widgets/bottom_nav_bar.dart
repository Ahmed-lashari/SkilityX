import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skility_x/constants/app_colors.dart';
import 'package:skility_x/view/themes/theme_conts/typography.dart';
import 'package:skility_x/view/ui_config/widgets/bottom_nav_bar.dart';

final selectedIndexProvider = StateProvider<int>((ref) => 0);

class CustomBottomNavBar extends ConsumerStatefulWidget {
  final List<BottomNavItem> items;
  final void Function(int index) onItemSelected;

  const CustomBottomNavBar(
      {super.key, required this.items, required this.onItemSelected});

  @override
  ConsumerState<CustomBottomNavBar> createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends ConsumerState<CustomBottomNavBar> {
  @override
  Widget build(BuildContext context) {
    debugPrint('whole nav bar rebuilding');
    return Align(
        alignment: Alignment.bottomCenter,
        child: Container(
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: AppColors.secondary,
              borderRadius: BorderRadius.circular(50),
            ),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    physics: const BouncingScrollPhysics(),
                    child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: List.generate(
                          widget.items.length,
                          (index) {
                            return GestureDetector(
                              onTap: () {
                                ref.read(selectedIndexProvider.notifier).state =
                                    index;
                                widget.onItemSelected(index);
                              },
                              child: Consumer(builder: (context, ref, child) {
                                final selectedIndex =
                                    ref.watch(selectedIndexProvider);
                                final isSelected = index == selectedIndex;
                                final item = widget.items[index];
                                debugPrint(
                                    'building bottom menu container only');
                                return AnimatedContainer(
                                  duration: const Duration(milliseconds: 300),
                                  curve: Curves.easeInOut,
                                  padding: const EdgeInsets.all(15),
                                  decoration: BoxDecoration(
                                    color: isSelected
                                        ? Colors.yellow
                                        : Colors.white,
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      if (item.icon != null)
                                        Icon(item.icon,
                                            size: 25,
                                            color: isSelected
                                                ? Colors.blue
                                                : Colors.black),
                                      AnimatedSize(
                                        duration:
                                            const Duration(milliseconds: 300),
                                        curve: Curves.easeInOut,
                                        child: (isSelected) &&
                                                (item.label != null)
                                            ? Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 8.0),
                                                child: Text(
                                                  item.label ?? "",
                                                  style: TextStyle(
                                                    fontFamily: AppTypography
                                                        .interMedium,
                                                    fontSize: 15,
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                              )
                                            : const SizedBox.shrink(),
                                      ),
                                    ],
                                  ),
                                );
                              }),
                            );
                          },
                        ))))));
  }
}
