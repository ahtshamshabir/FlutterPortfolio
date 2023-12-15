import 'package:flutter_portfolio/models/skill_detail.dart';

class WorkExperience {
  final String title, company, duration;
  final List<String> descriptionBullets;
  final List<SkillDetail> skills;

  const WorkExperience({
    required this.title,
    required this.company,
    required this.duration,
    this.descriptionBullets = const [],
    this.skills = const [],
  });
}
