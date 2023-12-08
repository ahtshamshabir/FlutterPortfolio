import 'package:flutter/material.dart';
import 'package:flutter_portfolio/utils/dynamic_scaler.dart';
import 'package:flutter_portfolio/utils/svg_icons.dart';
import 'package:flutter_portfolio/utils/theme_utils.dart';
import 'package:flutter_portfolio/widgets/section_surface.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SkillsSection extends StatelessWidget with ThemeUtils {
  SkillsSection({super.key});

  @override
  Widget build(BuildContext context) {
    initThemeUtils(context);
    return SectionSurface(
      padding: EdgeInsets.symmetric(horizontal: 5.vw, vertical: 4.vw),
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
                style: textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w700,
                  fontSize: 40,
                ),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: AspectRatio(
                  aspectRatio: 1.98,
                  child: GridView(
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 6,
                      childAspectRatio: 1,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20,
                    ),
                    children: [
                      SkillCard(icon: SvgIcons.flutter, title: 'Flutter'),
                      SkillCard(icon: SvgIcons.firebase, title: 'Firebase'),
                      SkillCard(
                        padding: EdgeInsets.fromLTRB(2.vw, 3.vw, 3.vw, 2.vw),
                        icon: SvgIcons.strapi,
                        title: 'Strapi',
                      ),
                      SkillCard(
                        padding: EdgeInsets.fromLTRB(1.vw, 2.vw, 2.vw, 2.vw),
                        icon: SvgIcons.neo4j,
                        title: 'Neo4j',
                      ),
                      SkillCard(icon: SvgIcons.react, title: 'React'),
                      SkillCard(icon: SvgIcons.vue, title: 'Vue'),
                      SkillCard(icon: SvgIcons.typescript, title: 'Typescript'),
                      SkillCard(icon: SvgIcons.nodejs, title: 'NodeJS'),
                      SkillCard(icon: SvgIcons.figma, title: 'Figma'),
                      SkillCard(icon: SvgIcons.php, title: 'PHP'),
                      SkillCard(icon: SvgIcons.mysql, title: 'MySQL'),
                      SkillCard(icon: SvgIcons.mongodb, title: 'MongoDB'),
                      SkillCard(icon: SvgIcons.google_cloud, title: 'Google Cloud'),
                      SkillCard(icon: SvgIcons.javascript, title: 'Javascript'),
                      SkillCard(icon: SvgIcons.graphql, title: 'GraphQL'),
                      SkillCard(
                        padding: EdgeInsets.fromLTRB(1.vw, 1.vw, 2.vw, 2.vw),
                        icon: SvgIcons.blender,
                        title: 'Blender',
                      ),
                      SkillCard(icon: SvgIcons.photoshop, title: 'Photoshop'),
                      SkillCard(icon: SvgIcons.illustrator, title: 'Illustrator'),
                    ],
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
      child: icon,
    );
  }
}
