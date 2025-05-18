import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:skility_x/constants/app-icons.dart';
import 'package:skility_x/constants/app_colors.dart';
import 'package:skility_x/constants/app_keys/hero_keys.dart';
import 'package:skility_x/core/config/route_config.dart';
import 'package:skility_x/core/utils.dart/utils.dart';
import 'package:skility_x/view/screens/home/1_skills/4_skill_details.dart';
import 'package:skility_x/view/themes/theme_conts/typography.dart';
import 'package:skility_x/view/ui_config/view/screens/home/1_skills/3_filter_screen.dart';
import 'package:skility_x/view/widgets/custom_progress_indicator.dart';
import 'package:skility_x/view/widgets/image_ui.dart';

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
                  fontFamily: AppTypography.scotishBold,
                  fontSize: 14)),
        Expanded(
            child: Divider(
                color: color ?? AppColors.unselectedItemIcon, thickness: 0)),
      ],
    );
  }

  static Widget OAuthOptions({
    String? text,
    Color? color,
    required GlobalKey<FormState> formKey,
    required VoidCallback GoogleOnTap,
    required VoidCallback GithubOnTap,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildAuthOption(
            text: "Google", icon: AppStaticIcons.gmail, onTap: GoogleOnTap),
        _buildAuthOption(
            text: "Github", icon: AppStaticIcons.github, onTap: GithubOnTap),
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

  static Widget backNavigationIconButt(
      {required BuildContext context, Color? iconColor}) {
    return Hero(
      tag: HeroKeys.iconButtonKey,
      child: IconButton(
          onPressed: () => AppNavigator.navigateBack(context),
          icon: CustomIcon(
            icon: AppImageIcons.leftarrow,
            color: iconColor ?? AppColors.onBackground,
            iconSize: 25,
          )),
    );
  }

  // static Widget onScreenLoading() {
  //   return LoaderOverlay(
  //     overlayWidgetBuilder: (_) {
  //       return Center(
  //         child: GradientCircularProgress(),
  //       );
  //     },
  //     overlayColor: A.withOpacity(0.8), // screen background coloro
  //   );
  // }

  static void customBottomSheet(
      BuildContext context, Widget body, Color color) {
    showMaterialModalBottomSheet(
      context: context,
      backgroundColor: AppColors.transparent,
      builder: (context) => SingleChildScrollView(
        controller: ModalScrollController.of(context),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: color,
          ),
          padding: const EdgeInsets.all(8.0),
          margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          child: body,
        ),
      ),
    );
  }

  static Widget anotherActionButton(
      BuildContext context, int index, FilterColorModel colorModel) {
    return Material(
      type: MaterialType.transparency,
      child: InkWell(
        onTap: () => AppNavigator.navigateTo(context,
            wRoute: SkillDetailsScreen(
              index: index,
              color: colorModel,
            )),
        borderRadius: BorderRadius.circular(16),
        splashColor: colorModel.textColor,
        child: Ink(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: colorModel.boxColor,
            ),
            child: Center(
                child: Text(
              'Start Learning',
              style: TextStyle(color: colorModel.textColor),
            ))),
      ),
    );
  }

  static Widget AppBarWelcom() {
    final text = Utils.getWelcomeText();
    return Text('$text Muhammad');
  }
}
