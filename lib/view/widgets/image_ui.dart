import 'dart:io';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skility_x/constants/app-icons.dart';
import 'package:skility_x/constants/app_colors.dart';
import 'package:skility_x/view-model/data_providers/view/widgets/caching_image.dart';
import 'package:skility_x/view/widgets/custom_progress_indicator.dart';

class ProfilePicture extends StatelessWidget {
  final String url;
  final File? imageFile;
  final double imageSize;
  final bool isMan;

  const ProfilePicture(
      {super.key,
      this.url = '',
      this.imageFile,
      this.imageSize = 50,
      this.isMan = true});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
        decoration: BoxDecoration(
            color: Colors.transparent, borderRadius: BorderRadius.circular(16)),
        child: ClipRRect(
            borderRadius: BorderRadius.circular(50), child: _buildImage()));
  }

  Widget _buildImage() {
    // image from gallery/camera
    if (imageFile != null) {
      return Image.file(imageFile!,
          // height: imageSize.h, width: imageSize.w,
          fit: BoxFit.cover);
    }

    // network image
    else if (url.isNotEmpty) {
      return CachedNetworkImage(
          imageUrl: url,
          height: imageSize,
          width: imageSize,
          fit: BoxFit.cover,
          placeholder: (_, url) => const GradientCircularProgress(),
          errorWidget: (_, url, error) => Padding(
              padding: EdgeInsets.all(16),
              child: Icon(AppStaticIcons.warning)));
    }
    debugPrint('i mage icon is returned null and empty');
    return SizedBox.shrink();
  }
}

class CustomIcon extends ConsumerWidget {
  final String icon;
  final double? height;
  final double? width;
  final Color? color;

  const CustomIcon(
      {super.key, required this.icon, this.height, this.width, this.color});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final assetCheck = ref.watch(assetCheckProvider(icon));

    return assetCheck.when(
      loading: () => SizedBox(
        height: height ?? 15,
        width: width ?? 15,
        child: GradientCircularProgress(),
      ),
      error: (_, __) => Icon(AppStaticIcons.warning,
          size: height ?? 15, color: AppColors.error),
      data: (exists) {
        if (exists) {
          if (icon.endsWith(".png")) {
            return Image.asset(
              icon,
              height: height ?? 15,
              width: width ?? 15,
              color: color,
            );
          }

          // other images check
          else {
            debugPrint("Picture from Others Image asset");
            return Image.asset(icon,
                height: height ?? 15, width: width ?? 15, color: color);
          }
        } else {
          return Icon(AppStaticIcons.warning, size: height ?? 15, color: color);
        }
      },
    );
  }
}
