import 'package:skility_x/constants/app_keys/image_keys.dart';

class CoverPhotoConfig {
  static List<List<String>> getCoverPhotoIdeas() {
    final isList = [
      [
        CoverPhotoKeys.academic1,
        CoverPhotoKeys.academic2,
        CoverPhotoKeys.academic3,
      ],
      [
        CoverPhotoKeys.artistic1,
        CoverPhotoKeys.artistic2,
        CoverPhotoKeys.artistic3,
      ],
      [
        CoverPhotoKeys.language1,
        CoverPhotoKeys.language2,
        CoverPhotoKeys.language3,
      ],
      [
        CoverPhotoKeys.tech1,
        CoverPhotoKeys.tech2,
        CoverPhotoKeys.tech3,
      ],
    ];
    return isList;
  }
}
