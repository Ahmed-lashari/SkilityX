import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:skility_x/constants/app-icons.dart';
import 'package:skility_x/constants/app_colors.dart';
import 'package:skility_x/view/themes/theme_conts/typography.dart';
import 'package:skility_x/view/widgets/custom_progress_indicator.dart';

class CustomWidgets {
  static Widget actionButton({
    required final String label,
    required final VoidCallback onPressed,
    final Color backgroundColor = AppColors.secondary,
    final Color textColor = AppColors.onSecondary,
  }) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          foregroundColor: textColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
          elevation: 0,
        ),
        onPressed: onPressed,
        child: Text(
          label,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
      ),
    );
  }

  static Widget myCachedImage(String? url) {
    debugPrint(url);
    return CachedNetworkImage(
      imageUrl: url ?? '',
      fit: BoxFit.contain,
      placeholder: (context, url) => GradientCircularProgress(),
      errorWidget: (context, url, error) => Icon(AppStaticIcons.warning),
    );
  }

  static Widget myDivider({String? text, Color? color}) {
    return Row(
      children: [
        Expanded(
            child: Divider(
                color: color ?? AppColors.unselectedItemIcon, thickness: 0)),
        if (text != null)
          Text(text,
              style: TextStyle(
                  color: AppColors.unselectedItemIcon,
                  fontFamily: AppTypography.interMedium,
                  fontSize: 14)),
        Expanded(
            child: Divider(
                color: color ?? AppColors.unselectedItemIcon, thickness: 0)),
      ],
    );
  }

  static Widget OAuthOptions({String? text, Color? color}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildAuthOption(
            text: "Google", icon: AppStaticIcons.gmail, onTap: () {}),
        _buildAuthOption(
            text: "Github", icon: AppStaticIcons.github, onTap: () {}),
      ],
    );
  }

  static Widget _buildAuthOption(
      {required String text,
      required IconData icon,
      required VoidCallback onTap}) {
    return Material(
      type: MaterialType.transparency,
      child: InkWell(
        splashColor: AppColors.secondary.withAlpha(100),
        borderRadius: BorderRadius.circular(16),
        onTap: onTap,
        child: Ink(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          decoration: BoxDecoration(
            color: AppColors.unselectedItemIcon,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Row(
            spacing: 10,
            children: [
              Icon(icon, color: AppColors.onSecondary, size: 20),
              Text(text,
                  style: TextStyle(color: AppColors.onSecondary, fontSize: 15))
            ],
          ),
        ),
      ),
    );
  }
}
