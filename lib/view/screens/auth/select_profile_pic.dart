import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skility_x/constants/app_colors.dart';
import 'package:skility_x/core/config/dep_injection/user_model.dart';
import 'package:skility_x/core/config/route_config.dart';
import 'package:skility_x/core/utils.dart/utils.dart';
import 'package:skility_x/view/ui_config/view/screens/auth/signup.dart';
import 'package:skility_x/view/widgets/app_bar.dart';
import 'package:skility_x/view/widgets/bottom_sheets/change_cover_photo.dart';
import 'package:skility_x/view/widgets/custom_scaffold.dart';
import 'package:skility_x/view/widgets/custom_widgets.dart';

class ProfilePhotoSetting extends StatefulWidget {
  const ProfilePhotoSetting({super.key});

  @override
  State<ProfilePhotoSetting> createState() => _CoverPhotoSettingState();
}

class _CoverPhotoSettingState extends State<ProfilePhotoSetting> {
  List<ProfileImagesModel> isList = [];

  @override
  void initState() {
    super.initState();
    isList = SignupConfig.getAvatarPictures();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appBar: myAppBar(
          context: context,
          title: Text('Select Your Profile Picture'),
          showLeading: true),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, crossAxisSpacing: 16, mainAxisSpacing: 16),
        itemCount: isList.length,
        itemBuilder: (context, index) {
          return _CoverPhotoCategoryCard(
            model: isList[index],
          );
        },
      ),
    );
  }
}

class _CoverPhotoCategoryCard extends ConsumerWidget {
  final ProfileImagesModel model;

  const _CoverPhotoCategoryCard({
    required this.model,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () => CustomWidgets.customBottomSheet(
          context,
          ChangeImage(
            imageUrl: model.url,
            title: model.title,
            onTap: () {
              ref.read(userModelDi.notifier).updatePicture(model.url);
              Utils.toastMsg(title: 'Image Selected');
              AppNavigator.navigateBack(context);
            },
          ),
          AppColors.transparent),
      child: Ink(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.network(
            model.title,
            fit: BoxFit.contain,
            errorBuilder: (context, error, stackTrace) => Container(
              color: Colors.grey[300],
              child: const Icon(Icons.broken_image),
            ),
          ),
        ),
      ),
    );
  }
}
