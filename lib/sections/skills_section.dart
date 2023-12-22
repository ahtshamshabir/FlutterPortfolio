import 'package:flutter/material.dart';
import 'package:flutter_portfolio/models/skill_detail.dart';
import 'package:flutter_portfolio/utils/dynamic_scaler.dart';
import 'package:flutter_portfolio/utils/svg_icons.dart';
import 'package:flutter_portfolio/utils/theme_utils.dart';
import 'package:flutter_portfolio/widgets/section_wrapper.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SkillsSection extends StatelessWidget with ThemeUtils {
  SkillsSection({super.key});

  int get cardsPerRow  {
    if (deviceSizeType.isDesktop) {
      return 6;
    } else {
      return 3;
    }
  }

  double get sectionPadding {
    if (deviceSizeType.isDesktop) return 120;
    return 70;
  }

  double get cardPadding {
    if (deviceSizeType.isDesktop) return 2.vw;
    return 5.vw;
  }

  @override
  Widget build(BuildContext context) {
    initThemeUtils(context);
    return SectionWrapper(
      padding: EdgeInsets.symmetric(horizontal:5.vw, vertical: sectionPadding),
      child: Align(
        alignment: Alignment.center,
        child: Container(
          height: double.infinity,
          decoration: BoxDecoration(
            color: colorScheme.surfaceVariant,
            borderRadius: BorderRadius.circular(30),
          ),
          padding: const EdgeInsets.fromLTRB(20, 10, 20, 20),
          child: Column(
            children: [
              Text(
                'Skills',
                style: textTheme.headlineLarge?.scaleMinMax(min: 20, max: 40),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: AspectRatio(
                  aspectRatio: 1.98,
                  child: LayoutBuilder(
                    builder: (context, constraints) {
                      var maxWidth = constraints.maxWidth;
                      var spacing = 20.0;
                      var cardSize = (maxWidth - (cardsPerRow - 1) * spacing) / cardsPerRow;
                      return Wrap(
                        spacing: spacing,
                        runSpacing: spacing,
                        children: [
                          ...skillRecords.map(
                            (skillRecord) => SizedBox(
                              width: cardSize,
                              height: cardSize,
                              child: SkillCard(
                                icon: skillRecord.details.icon,
                                title: skillRecord.details.name,
                                padding: skillRecord.padding ?? EdgeInsets.all(cardPadding),
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

typedef SkillRecord = ({SkillDetail details, EdgeInsets? padding});

var skillRecords = <SkillRecord>[
  (
    details: SkillDetail(
      name: 'Flutter',
      icon: SvgIcons.flutter,
    ),
    padding: null,
  ),
  (
    details: SkillDetail(
      name: 'Firebase',
      icon: SvgIcons.firebase,
    ),
    padding: null,
  ),
  (
    details: SkillDetail(
      name: 'Strapi',
      icon: SvgIcons.strapi,
    ),
    padding: EdgeInsets.fromLTRB(2.vw, 3.vw, 3.vw, 2.vw),
  ),
  (
    details: SkillDetail(
      name: 'Neo4j',
      icon: SvgIcons.neo4j,
    ),
    padding: EdgeInsets.fromLTRB(1.vw, 2.vw, 2.vw, 2.vw),
  ),
  (
    details: SkillDetail(
      name: 'React',
      icon: SvgIcons.react,
    ),
    padding: null,
  ),
  (
    details: SkillDetail(
      name: 'Vue',
      icon: SvgIcons.vue,
    ),
    padding: null,
  ),
  (
    details: SkillDetail(
      name: 'Typescript',
      icon: SvgIcons.typescript,
    ),
    padding: null,
  ),
  (
    details: SkillDetail(
      name: 'NodeJS',
      icon: SvgIcons.nodejs,
    ),
    padding: null,
  ),
  (
    details: SkillDetail(
      name: 'Figma',
      icon: SvgIcons.figma,
    ),
    padding: null,
  ),
  (
    details: SkillDetail(
      name: 'PHP',
      icon: SvgIcons.php,
    ),
    padding: null,
  ),
  (
    details: SkillDetail(
      name: 'MySQL',
      icon: SvgIcons.mysql,
    ),
    padding: null,
  ),
  (
    details: SkillDetail(
      name: 'MongoDB',
      icon: SvgIcons.mongodb,
    ),
    padding: null,
  ),
  (
    details: SkillDetail(
      name: 'Google Cloud',
      icon: SvgIcons.google_cloud,
    ),
    padding: null,
  ),
  (
    details: SkillDetail(
      name: 'Javascript',
      icon: SvgIcons.javascript,
    ),
    padding: null,
  ),
  (
    details: SkillDetail(
      name: 'GraphQL',
      icon: SvgIcons.graphql,
    ),
    padding: null,
  ),
  (
    details: SkillDetail(
      name: 'Blender',
      icon: SvgIcons.blender,
    ),
    padding: EdgeInsets.fromLTRB(1.vw, 1.vw, 2.vw, 2.vw),
  ),
  (
    details: SkillDetail(
      name: 'Photoshop',
      icon: SvgIcons.photoshop,
    ),
    padding: null,
  ),
  (
    details: SkillDetail(
      name: 'Illustrator',
      icon: SvgIcons.illustrator,
    ),
    padding: null,
  ),
];

class SkillCard extends StatelessWidget with ThemeUtils {
  final SvgPicture icon;
  final String title;
  final EdgeInsetsGeometry? padding;

  SkillCard({super.key, required this.icon, required this.title, this.padding});

  @override
  Widget build(BuildContext context) {
    initThemeUtils(context);
    return Container(
      padding: padding ?? EdgeInsets.all(2.vw),
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: BorderRadius.circular(10),
      ),
      child: icon.toPng(),
    );
  }
}
