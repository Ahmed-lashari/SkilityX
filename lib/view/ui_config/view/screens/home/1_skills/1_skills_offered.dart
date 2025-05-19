import 'package:flutter/material.dart';
import 'package:skility_x/constants/app-icons.dart';
import 'package:skility_x/constants/app_colors.dart';

class SkillsBanners {
  final String icon;
  final String label;
  final Color color;

  const SkillsBanners(
      {required this.icon, required this.label, required this.color});
}

class OurExperts {
  final String imageurl;
  final String name;
  final String skill;

  OurExperts({required this.imageurl, required this.name, required this.skill});
}

class SkillsOfferedConfig {
  static List<SkillsBanners> getSkillsBanners() {
    return [
      SkillsBanners(
          icon: AppImageIcons.academics,
          label: "Mathematics",
          color: AppColors.error),
      SkillsBanners(
          icon: AppImageIcons.coding,
          label: "Web - Dev",
          color: AppColors.primary),
      SkillsBanners(
          icon: AppImageIcons.dancing,
          label: "Dancing",
          color: AppColors.secondary),
      SkillsBanners(
          icon: AppImageIcons.data_analyss,
          label: "Robotics",
          color: AppColors.onBackground),
      SkillsBanners(
          icon: AppImageIcons.painting,
          label: "Painting",
          color: AppColors.primary),
      SkillsBanners(
          icon: AppImageIcons.singing,
          label: "Music",
          color: AppColors.secondary),
      SkillsBanners(
          icon: AppImageIcons.writing,
          label: "Language",
          color: AppColors.onBackground)
    ];
  }

  static List<OurExperts> getExpertsList() {
    return [
      OurExperts(
          imageurl:
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRxqvZ7fOAU8Qnq_f2adNhkUmC4luMGC2EVIA&s',
          name: "Fatima",
          skill: 'Dancing'),
      OurExperts(
          imageurl:
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS-q_ibNP68zXmP8XMH5AqFwKSUcWAIFn31gA&s',
          name: "Ahmed",
          skill: 'Singing'),
      OurExperts(
          imageurl:
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTJTPZmy2fumDMgmD-o-C4GB4R1p9mPvB10jg&s',
          name: "Uzair",
          skill: 'Cooking'),
      OurExperts(
          imageurl:
              'https://i.pinimg.com/736x/be/27/1a/be271a0971278867ead4f6a605c42746.jpg',
          name: "Anees",
          skill: 'Writing'),
      OurExperts(
          imageurl:
              'https://i.pinimg.com/564x/05/da/be/05dabefad8d4bc1aabfd84fe447e9539.jpg',
          name: "Manahil",
          skill: 'Coding'),
      OurExperts(
          imageurl:
              'https://pbs.twimg.com/profile_images/3536709466/e0c23535da5b1696d93151fb699052b4_400x400.jpeg',
          name: "Noman",
          skill: 'Sketching'),
      OurExperts(
          imageurl:
              'https://pbs.twimg.com/profile_images/1638775787502329856/unlOe3_N_400x400.jpg',
          name: "Sado",
          skill: 'Dancing'),
    ];
  }
}
