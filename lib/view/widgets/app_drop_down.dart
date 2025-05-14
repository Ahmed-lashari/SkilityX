import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skility_x/constants/app-icons.dart';
import 'package:skility_x/constants/app_colors.dart';
import 'package:skility_x/core/utils.dart/validators.dart';
import 'package:skility_x/view-model/data_providers/view/widgets/drop_down_list.dart';
import 'package:skility_x/view-model/data_providers/view/widgets/focus_nodes.dart';
import 'package:skility_x/view/themes/theme_conts/typography.dart';
import 'package:skility_x/view/widgets/image_ui.dart';

class myDropDwon extends ConsumerStatefulWidget {
  final String hintText;
  final IconData prefixIcon;
  final String dropdwonKey;
  final String? nextFocusKey;

  const myDropDwon({
    super.key,
    required this.hintText,
    required this.prefixIcon,
    required this.dropdwonKey,
    this.nextFocusKey,
  });

  @override
  ConsumerState<myDropDwon> createState() => _YapDropdownState();
}

class _YapDropdownState extends ConsumerState<myDropDwon> {
  @override
  Widget build(BuildContext context) {
    final items = ref.watch(dropdownItemsProvider(widget.dropdwonKey));
    final currFocus = ref.watch(focusNodeProvider(widget.dropdwonKey));
    final currentValue =
        ref.watch(formValuesProvider.select((map) => map[widget.dropdwonKey]));
    debugPrint(currentValue);

    return DropdownButtonFormField<String>(
      icon: CustomIcon(
        icon: AppImageIcons.downarrow,
        color: AppColors.secondary,
        iconSize: 25,
      ),
      items: items
          .map((item) => DropdownMenuItem(
                value: item.trim(),
                child: Text(item.trim(),
                    style: TextStyle(
                        color: AppColors.onSecondary,
                        fontSize: 16,
                        fontFamily: AppTypography.scotishBold)),
              ))
          .toList(),
      decoration: InputDecoration(
        prefixIcon: Icon(widget.prefixIcon, size: 20),
        hintText: widget.hintText,
        // hintStyle: TextStyle(
        //     color: AppColors.error.withAlpha(100),
        //     fontFamily: AppTypography.scotishRegular),
      ),
      focusNode: currFocus,
      dropdownColor: AppColors.unselectedItemIcon,
      isExpanded: true,
      onChanged: (v) {
        ref.read(formValuesProvider.notifier).setValue(widget.dropdwonKey, v);
        if (widget.nextFocusKey != null) {
          final nextFocus = ref.read(focusNodeProvider(widget.nextFocusKey!));
          FocusScope.of(context).requestFocus(nextFocus);
        } else {
          currFocus.unfocus();
        }
      },
      validator: (v) => Validators.requiredField(v),
    );
  }
}
