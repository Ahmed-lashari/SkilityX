import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skility_x/constants/app-icons.dart';
import 'package:skility_x/constants/app_colors.dart';
import 'package:skility_x/constants/app_keys/hero_keys.dart';
import 'package:skility_x/core/config/dep_injection/user_model.dart';
import 'package:skility_x/core/config/route_config.dart';
import 'package:skility_x/core/utils.dart/utils.dart';
import 'package:skility_x/models/Users/users.dart';
import 'package:skility_x/view/screens/home/3_profile/2_adv_course_screen.dart';
import 'package:skility_x/view/themes/theme_conts/typography.dart';
import 'package:skility_x/view/widgets/bottom_sheets/change_cover_photo.dart';
import 'package:skility_x/view/widgets/custom_scaffold.dart';
import 'package:skility_x/view/widgets/custom_widgets.dart';
import 'package:skility_x/view/widgets/image_ui.dart';

class Profile extends StatefulWidget {
  final Users user;
  const Profile({super.key, required this.user});

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
        spacing: 16,
        // imiage and user section using stack
        children: [_buildImageAndUserSection(), _buildBottomBody()],
      ),
      floatingActionButton: _buildFAB(),
    );
  }

  Widget _buildFAB() {
    return FloatingActionButton(
      backgroundColor: AppColors.error,
      foregroundColor: AppColors.onBackground,
      heroTag: HeroKeys.fabActionHeroTag,
      onPressed: () =>
          AppNavigator.navigateTo(context, wRoute: AdvertiseCourseScreen()),
      child: CustomIcon(icon: AppImageIcons.appLogo, iconSize: 30),
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
          child: Consumer(
            builder: (context, ref, child) {
              final updatedUser = ref.watch(userModelDi);
              debugPrint("building only cover photo");
              return ProfilePicture(
                isCover: true,
                url: "${updatedUser.coverPhotoUrl}",
              );
            },
          ),
        ),
        Positioned(
          right: 10,
          top: 10,
          child: GestureDetector(
            onTap: () => CustomWidgets.customBottomSheet(
                context,
                BottomSheetCoverPhoto(user: widget.user),
                AppColors.transparent),
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
      top: Utils.getHeight(context) * 0.2,
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
              widget.user.name.toUpperCase(),
              maxLines: 2,
              style: TextStyle(
                  fontFamily: AppTypography.scotishBold,
                  fontSize: 18,
                  overflow: TextOverflow.ellipsis,
                  color: AppColors.unselectedItemIcon),
            ),
            Text(
              widget.user.mainSkill.toUpperCase(),
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
          url: "${widget.user.profilePicUrl}",
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
