import 'package:flutter/material.dart';
import 'package:skility_x/constants/app-icons.dart';
import 'package:skility_x/constants/app_colors.dart';
import 'package:skility_x/constants/app_keys/hero_keys.dart';
import 'package:skility_x/constants/app_keys/image_keys.dart';
import 'package:skility_x/core/config/route_config.dart';
import 'package:skility_x/core/utils.dart/utils.dart';
import 'package:skility_x/view/screens/home/3_profile/2_adv_course_screen.dart';
import 'package:skility_x/view/themes/theme_conts/typography.dart';
import 'package:skility_x/view/widgets/bottom_sheets/change_cover_photo.dart';
import 'package:skility_x/view/widgets/custom_scaffold.dart';
import 'package:skility_x/view/widgets/custom_widgets.dart';
import 'package:skility_x/view/widgets/image_ui.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    debugPrint('building profile screen');
    return CustomScaffold(
      hPadding: 0,
      backGroundColor: AppColors.unselectedItemIcon,
      isScrollable: true,
      body: Column(
        children: [
          // imiage and user section using sstack
          _buildImageAndUserSection(),

          _buildBottomBody(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.error,
        foregroundColor: AppColors.onBackground,
        heroTag: HeroKeys.fabActionHeroTag,
        onPressed: () =>
            AppNavigator.navigateTo(context, wRoute: AdvertiseCourseScreen()),
        child: CustomIcon(icon: AppImageIcons.appLogo, iconSize: 30),
      ),
    );
  }

  Widget _buildImageAndUserSection() {
    return Container(
      height: Utils.getHeight(context) * 0.4,
      child: Stack(
        children: [_buildCoverPhoto(), _buildUserSection()],
      ),
    );
  }

  // cover photo
  Widget _buildCoverPhoto() {
    return Container(
      width: Utils.getWeidth(context),
      height: Utils.getHeight(context) * 0.25,
      decoration: BoxDecoration(
        color: AppColors.selectedItemIcon,
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(50)),
      ),
      child: Stack(children: [
        Positioned.fill(
          child: ProfilePicture(
            isCover: true,
            url:
                "https://plus.unsplash.com/premium_photo-1673177667569-e3321a8d8256?fm=jpg&q=60&w=3000&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8Y292ZXIlMjBwaG90b3xlbnwwfHwwfHx8MA%3D%3D",
          ),
        ),
        Positioned(
          right: 10,
          top: 10,
          child: GestureDetector(
            onTap: () => CustomWidgets.customBottomSheet(
                context, BottomSheetCoverPhoto(), AppColors.transparent),
            child: CustomIcon(
              icon: AppImageIcons.camera,
              iconSize: 20,
              color: AppColors.primary,
            ),
          ),
        )
      ]),
    );
  }

  Widget _buildUserSection() {
    return Positioned(
      top: Utils.getHeight(context) * 0.169,
      left: 0,
      right: 0,
      child: Container(
        padding: EdgeInsets.all(5),
        margin: EdgeInsets.symmetric(horizontal: 15),
        width: Utils.getWeidth(context),
        height: Utils.getHeight(context) * 0.2,
        decoration: BoxDecoration(
            color: AppColors.onBackground,
            borderRadius: BorderRadius.circular(16)),
        child: Row(
          spacing: 3,
          children: [
            // details
            _buildTextualDetails(),

            // photo
            _buildUserProfilepic(),
          ],
        ),
      ),
    );
  }

  Widget _buildTextualDetails() {
    return Expanded(
      flex: 6,
      child: Container(
        height: Utils.getHeight(context),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "MUHAMMAD A LASHARI",
              maxLines: 2,
              style: TextStyle(
                  fontFamily: AppTypography.scotishBold,
                  fontSize: 18,
                  overflow: TextOverflow.ellipsis,
                  color: AppColors.unselectedItemIcon),
            ),
            Text(
              "PROGRAMMER",
              style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: AppColors.unselectedItemIcon),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildUserProfilepic() {
    return Expanded(
      flex: 4,
      child: Container(
        height: Utils.getHeight(context),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: AppColors.transparent,
            borderRadius: BorderRadius.circular(10)),
        child: ProfilePicture(
          url: AvatarKeys.pokieBoy,
          // imageSize: 100,
        ),
      ),
    );
  }

  Widget _buildBottomBody() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        spacing: 16,
        children: [
          // description
          _buildDesription(),

          // other details as needed
          _buildOtherDetails(),
        ],
      ),
    );
  }

  Widget _buildDesription() {
    return Container(
      width: Utils.getWeidth(context),
      padding: EdgeInsets.all(10),
      // margin: EdgeInsets.all(5),
      decoration: BoxDecoration(
          color: AppColors.error, borderRadius: BorderRadius.circular(10)),
      child: Text(
          'BIO:\nMy name is Muhammad Ahmed LAshari and i am a Flutter Developer with 2+ years of experience.',
          style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
    );
  }

  Widget _buildOtherDetails() {
    return Container(
      width: Utils.getWeidth(context),
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.all(5),
      decoration: BoxDecoration(
          color: AppColors.onBackground,
          borderRadius: BorderRadius.circular(10)),
      child: Text('Add other Details as needed.',
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: AppColors.error)),
    );
  }
}
