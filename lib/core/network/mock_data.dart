import 'package:flutter/material.dart';
import 'package:telesa_english_app/core/constants/app_color.dart';
import 'package:telesa_english_app/core/constants/generated/assets.gen.dart';
import 'package:telesa_english_app/features/teacher/domain/teacher_entity.dart';

final List<TeacherEntity> mockTeachers = [
  TeacherEntity(
    name: "Minseo Kim",
    imageUrl:
        "https://plus.unsplash.com/premium_photo-1689977927774-401b12d137d6?fm=jpg&q=60&w=3000",
    experience: "5 years",
    price: 300000,
    ratingValue: 4.6,
    ratingCount: 12,
    skills: [
      SkillEntity(
        title: "Reading",
        icon: AppAssets.iconsBookIcon.svg(
          width: 15,
          colorFilter: ColorFilter.mode(
            AppColors.primaryColor,
            BlendMode.srcIn,
          ),
        ),
      ),
      SkillEntity(
        title: "Speaking",
        icon: AppAssets.iconsSpeakIcon.svg(
          width: 15,
          colorFilter: ColorFilter.mode(
            AppColors.primaryColor,
            BlendMode.srcIn,
          ),
        ),
      ),
    ],
  ),
  TeacherEntity(
    name: "Hiro Tanaka",
    imageUrl:
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ1v4861_Ajg9SZVouryRX_Ix7TRLkrMGM5NQ&s",
    experience: "3 years",
    price: 250000,
    ratingValue: 4.8,
    ratingCount: 20,
    skills: [
      SkillEntity(
        title: "Writing",
        icon: AppAssets.iconsWriteIcon.svg(
          width: 15,
          colorFilter: ColorFilter.mode(
            AppColors.primaryColor,
            BlendMode.srcIn,
          ),
        ),
      ),
      SkillEntity(
        title: "Listening",
        icon: AppAssets.iconsSpeakIcon.svg(
          width: 15,
          colorFilter: ColorFilter.mode(
            AppColors.primaryColor,
            BlendMode.srcIn,
          ),
        ),
      ),
    ],
  ),
  TeacherEntity(
    name: "Sophia Lee",
    imageUrl:
        "https://images.unsplash.com/photo-1607746882042-944635dfe10e?ixlib=rb-4.0.3&q=80&w=2000",
    experience: "7 years",
    price: 400000,
    ratingValue: 4.9,
    ratingCount: 32,
    skills: [
      SkillEntity(
        title: "Speaking",
        icon: AppAssets.iconsSpeakIcon.svg(
          width: 15,
          colorFilter: ColorFilter.mode(
            AppColors.primaryColor,
            BlendMode.srcIn,
          ),
        ),
      ),
      SkillEntity(
        title: "Listening",
        icon: AppAssets.iconsWriteIcon.svg(
          width: 15,
          colorFilter: ColorFilter.mode(
            AppColors.primaryColor,
            BlendMode.srcIn,
          ),
        ),
      ),
    ],
  ),
  TeacherEntity(
    name: "David Nguyen",
    imageUrl:
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSlwBZHYrWDtR9jrrVLGtA3EAW-r2u3qXZvPg&s",
    experience: "2 years",
    price: 200000,
    ratingValue: 4.3,
    ratingCount: 8,
    skills: [
      SkillEntity(
        title: "Reading",
        icon: AppAssets.iconsBookIcon.svg(
          width: 15,
          colorFilter: ColorFilter.mode(
            AppColors.primaryColor,
            BlendMode.srcIn,
          ),
        ),
      ),
    ],
  ),
  TeacherEntity(
    name: "Emma Johnson",
    imageUrl:
        "https://images.unsplash.com/photo-1529626455594-4ff0802cfb7e?ixlib=rb-4.0.3&q=80&w=2000",
    experience: "6 years",
    price: 350000,
    ratingValue: 4.7,
    ratingCount: 15,
    skills: [
      SkillEntity(
        title: "Writing",
        icon: AppAssets.iconsWriteIcon.svg(
          width: 15,
          colorFilter: ColorFilter.mode(
            AppColors.primaryColor,
            BlendMode.srcIn,
          ),
        ),
      ),
    ],
  ),
];
