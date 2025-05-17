import 'package:skility_x/constants/app_keys/image_keys.dart';

class ProfileImagesModel {
  final String url;
  final String title;

  ProfileImagesModel({required this.url, required this.title});
}

class SignupConfig {
  static List<ProfileImagesModel> getAvatarPictures() {
    return [
      ProfileImagesModel(url: AvatarKeys.blinkRizz, title: 'Blink Rizz'),
      ProfileImagesModel(url: AvatarKeys.classySlay, title: 'Classy Slay'),
      ProfileImagesModel(url: AvatarKeys.cryShaggy, title: 'Skibidi Shaggy'),
      ProfileImagesModel(url: AvatarKeys.pokieBoy, title: 'Pookie Boi'),
      ProfileImagesModel(url: AvatarKeys.shyGal, title: 'Shy Gal'),
      ProfileImagesModel(url: AvatarKeys.slayQueen, title: 'Slay Quin'),
      ProfileImagesModel(url: AvatarKeys.uwuChan, title: 'UWU-Chan'),
    ];
  }
}
