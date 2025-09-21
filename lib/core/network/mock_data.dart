import 'package:flutter/material.dart';
import 'package:telesa_english_app/core/constants/app_color.dart';
import 'package:telesa_english_app/core/constants/generated/assets.gen.dart';
import 'package:telesa_english_app/features/home/domain/entities/lesson_entity.dart';
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

final List<LessonEntity> mockLessons = [
  // ----- Adults -----
  LessonEntity(
    name: "Practical English for Work & Life",
    description: "Learn basic vocabulary and common phrases",
    imageUrl:
        "https://images.unsplash.com/photo-1503676260728-1c00da094a0b?ixlib=rb-4.0.3&q=80&w=2000",
    level: "Advance",
    duration: "21:55:31",
    ratingValue: 4.6,
    ratingCount: 12,
    category: LessonCategory.adults,
  ),
  LessonEntity(
    name: "Business English Essentials",
    description: "Improve communication skills for workplace",
    imageUrl:
        "https://images.unsplash.com/photo-1522202176988-66273c2fd55f?ixlib=rb-4.0.3&q=80&w=2000",
    level: "Intermediate",
    duration: "12:40:20",
    ratingValue: 4.8,
    ratingCount: 25,
    category: LessonCategory.adults,
  ),
  LessonEntity(
    name: "IELTS Preparation Course",
    description: "Boost your IELTS skills with practice tests",
    imageUrl:
        "https://images.unsplash.com/photo-1513258496099-48168024aec0?ixlib=rb-4.0.3&q=80&w=2000",
    level: "Advance",
    duration: "30:15:10",
    ratingValue: 4.9,
    ratingCount: 40,
    category: LessonCategory.adults,
  ),
  LessonEntity(
    name: "Everyday Conversational English",
    description: "Master daily conversations and fluency",
    imageUrl:
        "https://images.unsplash.com/photo-1588702547923-7093a6c3ba33?ixlib=rb-4.0.3&q=80&w=2000",
    level: "Beginner",
    duration: "10:05:00",
    ratingValue: 4.7,
    ratingCount: 30,
    category: LessonCategory.adults,
  ),

  // ----- Kids -----
  LessonEntity(
    name: "Fun English for Kids",
    description: "Play-based activities to build English naturally",
    imageUrl:
        "https://images.unsplash.com/photo-1596495577886-d920f1fb7238?ixlib=rb-4.0.3&q=80&w=2000",
    level: "Beginner",
    duration: "05:30:20",
    ratingValue: 4.9,
    ratingCount: 40,
    category: LessonCategory.kids,
  ),
  LessonEntity(
    name: "English Alphabet Adventure",
    description: "Learn ABCs with songs and games",
    imageUrl:
        "https://images.unsplash.com/photo-1503457574462-bd27054394c1?ixlib=rb-4.0.3&q=80&w=2000",
    level: "Beginner",
    duration: "03:10:15",
    ratingValue: 4.8,
    ratingCount: 22,
    category: LessonCategory.kids,
  ),
  LessonEntity(
    name: "Storytime English",
    description: "Learn English through fairy tales and stories",
    imageUrl:
        "https://images.unsplash.com/photo-1517935706615-2717063c2225?ixlib=rb-4.0.3&q=80&w=2000",
    level: "Intermediate",
    duration: "07:45:30",
    ratingValue: 4.7,
    ratingCount: 18,
    category: LessonCategory.kids,
  ),
  LessonEntity(
    name: "English for Travel (Kids Edition)",
    description: "Learn phrases for family trips abroad",
    imageUrl:
        "https://images.unsplash.com/photo-1544717302-de2939b7ef71?ixlib=rb-4.0.3&q=80&w=2000",
    level: "Beginner",
    duration: "06:15:45",
    ratingValue: 4.7,
    ratingCount: 18,
    category: LessonCategory.kids,
  ),
];

List<LessonEntity> getAdultLessons() {
  return mockLessons
      .where((lesson) => lesson.category == LessonCategory.adults)
      .toList();
}

List<LessonEntity> getKidsLessons() {
  return mockLessons
      .where((lesson) => lesson.category == LessonCategory.kids)
      .toList();
}
