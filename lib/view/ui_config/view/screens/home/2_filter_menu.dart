import 'package:skility_x/constants/app-icons.dart';
import 'package:skility_x/constants/app_colors.dart';
import 'package:skility_x/view/ui_config/view/screens/home/1_skills_offered.dart';

class FilterMenuConfig {
  static List<SkillsBanners> getAcademicSkillsBanners() {
    return [
      SkillsBanners(
          icon: AppImageIcons.maths,
          label: "Mathematics",
          color: AppColors.primary),
      SkillsBanners(
          icon: AppImageIcons.history,
          label: "History",
          color: AppColors.selectedItemIcon),
      SkillsBanners(
          icon: AppImageIcons.language,
          label: "Language",
          color: AppColors.unselectedItemIcon),
      SkillsBanners(
          icon: AppImageIcons.science,
          label: "Science",
          color: AppColors.onBackground)
    ];
  }

  static List<SkillsBanners> getArtisticSkillsBanners() {
    return [
      SkillsBanners(
          icon: AppImageIcons.song, label: "Music", color: AppColors.error),
      SkillsBanners(
          icon: AppImageIcons.painting,
          label: "Painting",
          color: AppColors.onBackground),
      SkillsBanners(
          icon: AppImageIcons.photography,
          label: "Photography",
          color: AppColors.primary),
      SkillsBanners(
          icon: AppImageIcons.videoEditing,
          label: "Videography",
          color: AppColors.onBackground),
    ];
  }

  static List<SkillsBanners> getLanguageSkillsBanners() {
    return [
      SkillsBanners(
          icon: AppImageIcons.arabic,
          label: "Arabic",
          color: AppColors.onBackground),
      SkillsBanners(
          icon: AppImageIcons.chinese,
          label: "Chinese",
          color: AppColors.error),
      SkillsBanners(
          icon: AppImageIcons.english,
          label: "English",
          color: AppColors.unselectedItemIcon),
      SkillsBanners(
          icon: AppImageIcons.urdu, label: "Urdu", color: AppColors.error),
      SkillsBanners(
          icon: AppImageIcons.japanese,
          label: "Japanese",
          color: AppColors.primary),
      SkillsBanners(
          icon: AppImageIcons.hindi,
          label: "Hindi",
          color: AppColors.secondary),
    ];
  }

  static List<SkillsBanners> getTechSkillsBanners() {
    return [
      SkillsBanners(
          icon: AppImageIcons.ai,
          label: "AI",
          color: AppColors.unselectedItemIcon),
      SkillsBanners(
          icon: AppImageIcons.appDevelopment,
          label: "App - Dev",
          color: AppColors.primary),
      SkillsBanners(
          icon: AppImageIcons.webDevelopment,
          label: "Web - Dev",
          color: AppColors.secondary),
      SkillsBanners(
          icon: AppImageIcons.cyber,
          label: "Cyber Security",
          color: AppColors.onBackground),
      SkillsBanners(
          icon: AppImageIcons.uiux, label: "UI/UX", color: AppColors.error),
      SkillsBanners(
          icon: AppImageIcons.robotics,
          label: "Robotics",
          color: AppColors.primary)
    ];
  }
}
