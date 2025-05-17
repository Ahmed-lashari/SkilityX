import 'package:flutter/material.dart';
import 'package:skility_x/constants/app_colors.dart';
import 'package:skility_x/core/config/route_config.dart';
import 'package:skility_x/view/screens/home/4_settings/cover_photo_setting.dart';
import 'package:skility_x/view/themes/theme_conts/typography.dart';
import 'package:skility_x/view/widgets/custom_widgets.dart';

class BottomSheetCoverPhoto extends StatelessWidget {
  const BottomSheetCoverPhoto({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 10,
      children: [
        CustomWidgets.actionButton(
            backgroundColor: AppColors.onBackground,
            textColor: AppColors.error,
            label: 'Add Cover Photo',
            onPressed: () {
              AppNavigator.navigateBack(context);
              AppNavigator.navigateTo(context, wRoute: CoverPhotoSetting());
            })
      ],
    );
  }
}

class ChangeImage extends StatelessWidget {
  final String imageUrl;
  final String title;
  final VoidCallback onTap;

  const ChangeImage({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8.0),
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
          color: AppColors.error, borderRadius: BorderRadius.circular(16)),
      child: Column(
        spacing: 16,
        children: [
          // title
          Text(
            title,
            style:
                TextStyle(fontSize: 18, fontFamily: AppTypography.scotishBold),
          ),

          // image
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(
              imageUrl,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => Container(
                width: double.infinity,
                height: 200,
                color: Colors.grey[300],
                child: const Icon(Icons.broken_image, size: 40),
              ),
            ),
          ),

          // Icon Button
          CustomWidgets.actionButton(
              backgroundColor: AppColors.unselectedItemIcon,
              label: "Select This Image",
              onPressed: onTap),
        ],
      ),
    );
  }
}
