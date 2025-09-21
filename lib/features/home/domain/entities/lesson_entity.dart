enum LessonCategory { kids, adults }

class LessonEntity {
  final String name;
  final String description;
  final String imageUrl;
  final String level; // "Beginner", "Intermediate", "Advance"
  final String duration; // "21:55:31"
  final double ratingValue;
  final int ratingCount;
  final LessonCategory category; // Kids or Adults

  const LessonEntity({
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.level,
    required this.duration,
    required this.ratingValue,
    required this.ratingCount,
    required this.category,
  });
}
