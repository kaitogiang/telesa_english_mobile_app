import 'package:flutter/material.dart';

class TeacherEntity {
  final String name;
  final String imageUrl;
  final String experience;
  final List<SkillEntity> skills;
  final int price; // 300000
  final double ratingValue; // 4.6
  final int ratingCount; // 12

  const TeacherEntity({
    required this.name,
    required this.imageUrl,
    required this.experience,
    required this.skills,
    required this.price,
    required this.ratingValue,
    required this.ratingCount,
  });
}

class SkillEntity {
  final String title;
  final Widget icon;

  const SkillEntity({required this.title, required this.icon});
}
