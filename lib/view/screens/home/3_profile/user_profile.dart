import 'package:flutter/material.dart';
import 'package:skility_x/constants/app_colors.dart';
import 'package:skility_x/constants/app_keys/image_avatar_keys.dart';
import 'package:skility_x/core/utils.dart/utils.dart';
import 'package:skility_x/view/themes/theme_conts/typography.dart';
import 'package:skility_x/view/widgets/custom_scaffold.dart';
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
      backGroundColor: AppColors.unselectedItemIcon,
      hPadding: 0,
      isScrollable: true,
      body: Column(
        children: [
          // imiage and user section using sstack
          _buildImageAndUserSection(),
        ],
      ),
    );
  }

  Widget _buildImageAndUserSection() {
    return Container(
      height: Utils.getHeight(context) * 0.4,
      // color: AppColors.error,
      child: Stack(
        children: [
          _buildCoverPhoto(),
          _buildUserSection(),
        ],
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
      child: ProfilePicture(
        isCover: true,
        url:
            "https://plus.unsplash.com/premium_photo-1673177667569-e3321a8d8256?fm=jpg&q=60&w=3000&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8Y292ZXIlMjBwaG90b3xlbnwwfHwwfHx8MA%3D%3D",
      ),
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
}
