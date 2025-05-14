import 'package:flutter/material.dart';
import 'package:skility_x/constants/app_colors.dart';
import 'package:skility_x/view/themes/theme_conts/typography.dart';
import 'package:skility_x/view/ui_config/view/screens/home/4_settings/cover_photo_setting.dart';
import 'package:skility_x/view/widgets/bottom_sheets/change_cover_photo.dart';
import 'package:skility_x/view/widgets/custom_scaffold.dart';
import 'package:skility_x/view/widgets/custom_widgets.dart';

class CoverPhotoSetting extends StatefulWidget {
  const CoverPhotoSetting({super.key});

  @override
  State<CoverPhotoSetting> createState() => _CoverPhotoSettingState();
}

class _CoverPhotoSettingState extends State<CoverPhotoSetting> {
  List<List<String>> isList = [];

  @override
  void initState() {
    super.initState();
    isList = CoverPhotoConfig.getCoverPhotoIdeas();
  }

  String title = "";

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appBar: AppBar(
          title: Text('Select Covers'),
          automaticallyImplyLeading: false,
          leading: CustomWidgets.backNavigationIconButt(context: context)),
      body: ListView.builder(
        itemCount: isList.length,
        itemBuilder: (context, index) {
          if (index == 0) {
            title = 'Academic Covers';
          } else if (index == 1) {
            title = 'Artistic Covers';
          } else if (index == 2) {
            title = 'Language Covers';
          } else if (index == 3) {
            title = 'Tech Covers';
          }
          return _CoverPhotoCategoryCard(
            title: title,
            imageUrls: isList[index],
          );
        },
      ),
    );
  }
}

class _CoverPhotoCategoryCard extends StatelessWidget {
  final String title;
  final List<String> imageUrls;

  const _CoverPhotoCategoryCard({
    required this.title,
    required this.imageUrls,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style:
                TextStyle(fontSize: 18, fontFamily: AppTypography.scotishBold),
          ),
          const SizedBox(height: 10),
          SizedBox(
            height: 120,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: imageUrls.length,
              separatorBuilder: (_, __) => const SizedBox(width: 12),
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () => CustomWidgets.customBottomSheet(
                      context,
                      ChangeCoverPhoto(
                          imageUrl: imageUrls[index], title: title),
                      AppColors.transparent),
                  child: Ink(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.network(
                        imageUrls[index],
                        width: 200,
                        height: 120,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) => Container(
                          width: 120,
                          height: 120,
                          color: Colors.grey[300],
                          child: const Icon(Icons.broken_image),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
