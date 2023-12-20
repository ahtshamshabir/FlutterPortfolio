import 'dart:js_interop';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_portfolio/data/work_experiences.dart';
import 'package:flutter_portfolio/models/skill_detail.dart';
import 'package:flutter_portfolio/sections/skills_section.dart';
import 'package:flutter_portfolio/utils/dynamic_scaler.dart';
import 'package:flutter_portfolio/utils/separate_widgets.dart';
import 'package:flutter_portfolio/utils/svg_icons.dart';
import 'package:flutter_portfolio/utils/theme_utils.dart';
import 'package:flutter_portfolio/widgets/section_wrapper.dart';
import 'package:flutter_svg/flutter_svg.dart';

class WorkSection extends StatefulWidget {
  WorkSection({super.key});

  @override
  State<WorkSection> createState() => _WorkSectionState();
}

class _WorkSectionState extends State<WorkSection> with ThemeUtils {
  late PageController controller;
  int currentPage = 0;

  @override
  void initState() {
    super.initState();
    controller = PageController();
  }

  int get totalPages => workExperiences.length;

  double get padding {
    if(deviceSizeType.isDesktop) return 20;
    return 0;
  }

  @override
  Widget build(BuildContext context) {
    initThemeUtils(context);
    return SectionWrapper(
      padding: EdgeInsets.symmetric(vertical: 120),
      child: Align(
        alignment: Alignment.center,
        child: Container(
          height: double.infinity,
          padding: EdgeInsets.all(padding),
          child: Column(
            children: [
              SizedBox(height: 2.vw),
              Center(
                child: SizedBox(
                  width: 38.5.vw,
                  child: ListenableBuilder(
                    listenable: controller,
                    builder: (context, _) {
                      var page = controller.hasClients ? controller.page! : 0.0;
                      return Pagination(
                        total: totalPages,
                        dotSize: 2.5.vw,
                        lineHeight: 0.3.vw,
                        currentProgress: page,
                      );
                    },
                  ),
                ),
              ),
              SizedBox(height: 2.vw),
              Expanded(
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    PageView(
                      controller: controller,
                      children: [
                        ...workExperiences.map(
                          (w) => ExperiencePaddingWrapper(
                            child: WorkExperienceSection(
                              title: w.title,
                              company: w.company,
                              duration: w.duration,
                              descriptionBullets: w.descriptionBullets,
                              skills: w.skills,
                            ),
                          ),
                        ),
                      ],
                    ),
                    ListenableBuilder(
                        listenable: controller,
                        builder: (context, _) {
                          return Row(
                            children: [
                              ExpIconButton(
                                isFlipped: true,
                                icon: Icons.arrow_forward_ios,
                                onPressed: currentPage > 0
                                    ? () {
                                        controller.animateToPage(
                                          --currentPage,
                                          duration: const Duration(milliseconds: 500),
                                          curve: Curves.ease,
                                        );
                                      }
                                    : null,
                              ),
                              const Spacer(),
                              ExpIconButton(
                                icon: Icons.arrow_forward_ios,
                                onPressed: currentPage < totalPages - 1
                                    ? () {
                                        controller.animateToPage(
                                          ++currentPage,
                                          duration: const Duration(milliseconds: 500),
                                          curve: Curves.ease,
                                        );
                                      }
                                    : null,
                              ),
                            ],
                          );
                        }),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ExpIconButton extends StatelessWidget with ThemeUtils {
  IconData icon;
  Function()? onPressed;
  bool isFlipped;

  ExpIconButton({
    super.key,
    required this.icon,
    this.onPressed,
    this.isFlipped = false,
  });

  @override
  Widget build(BuildContext context) {
    initThemeUtils(context);
    Widget i = Icon(
      icon,
      color: colorScheme.onBackground.withOpacity(0.2),
      size: 6.vw,
    );
    if (isFlipped) {
      i = Transform(
        alignment: Alignment.center,
        transform: Matrix4.rotationZ(3.14),
        child: i,
      );
    }
    return InkWell(
      borderRadius: BorderRadius.circular(100.vw),
      onTap: onPressed,
      child: Container(
        padding: EdgeInsets.all(2.vw),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100.vw),
        ),
        child: i,
      ),
    );
  }
}

class ExperiencePaddingWrapper extends StatelessWidget {
  Widget child;

  ExperiencePaddingWrapper({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.vw),
      child: child,
    );
  }
}

class WorkExperienceSection extends StatelessWidget with ThemeUtils {
  String title, company, duration;
  List<String> descriptionBullets;
  List<SkillDetail> skills;

  WorkExperienceSection({
    super.key,
    this.title = 'Awesome Title',
    this.company = 'Company Name',
    this.duration = '2021 - Present',
    this.descriptionBullets = const [],
    this.skills = const [],
  });

  @override
  Widget build(BuildContext context) {
    initThemeUtils(context);
    return Container(
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: FittedBox(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: textTheme.headlineLarge,
                      ),
                      Text(
                        '$company ($duration)',
                        style: textTheme.bodyLarge,
                      ),
                    ],
                  ),
                ),
              ),
              const Spacer(),
              if(deviceSizeType.isDesktop)
              SizedBox(
                width: 18.vw,
                child: SkillsWidget(
                  skills: skills,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          BulletList(
            children: [
              ...descriptionBullets.map(
                (e) => Text(
                  e,
                  style: textTheme.bodyLarge,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class BulletList extends StatelessWidget with ThemeUtils{
  List<Widget> children;

  BulletList({super.key, this.children = const []});

  @override
  Widget build(BuildContext context) {
    initThemeUtils(context);
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          for (var i = 0; i < children.length; i++) ...[
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  '•',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 30,
                    height: 0.8,
                  ),
                ),
                const SizedBox(width: 20),
                Expanded(child: children[i]),
              ],
            ),
            if (i != children.length - 1) const SizedBox(height: 10),
          ],
        ],
      ),
    );
  }
}

class SkillsWidget extends StatelessWidget {
  List<SkillDetail> skills;

  SkillsWidget({super.key, this.skills = const []});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        var maxWidth = constraints.maxWidth;
        var cardsPerRow = 5;
        var padding = 10.0;
        var cardSize = (maxWidth - (padding * (cardsPerRow - 1))) / cardsPerRow;
        return Container(
          child: Wrap(
            spacing: padding,
            runSpacing: padding,
            direction: Axis.horizontal,
            verticalDirection: VerticalDirection.up,
            textDirection: TextDirection.rtl,
            children: [
              ...skills.map(
                (skill) => SizedBox(
                  height: cardSize,
                  width: cardSize,
                  child: SkillCard(
                    title: skill.name,
                    icon: skill.icon,
                    padding: EdgeInsets.all(0.52.vw),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class Pagination extends StatelessWidget with ThemeUtils {
  int total;
  double currentProgress;
  double dotSize, lineHeight;

  Pagination({
    super.key,
    this.dotSize = 50,
    this.lineHeight = 10,
    this.total = 4,
    this.currentProgress = 0,
  }) {
    currentProgress = currentProgress.clamp(0, total.toDouble());
  }

  bool isActive(int index) => index <= currentProgress + (total / (total * 4));

  double indexProgress(int index) {
    var progress = currentProgress - index;
    if (progress < 0) progress = 0;
    return progress;
  }

  @override
  Widget build(BuildContext context) {
    initThemeUtils(context);
    return Container(
      child: Row(
        children: [
          for (var i = 0; i < total; i++) ...[
            PaginationDot(
              isActive: isActive(i),
              isSelected: i == currentProgress.round(),
              size: dotSize,
            ),
            if (i != total - 1) ...[
              SizedBox(width: 0.5.vw),
              Flexible(
                child: PaginationLine(
                  progress: indexProgress(i),
                  height: lineHeight,
                ),
              ),
              SizedBox(width: 0.5.vw),
            ],
          ],
        ],
      ),
    );
  }
}

class PaginationDot extends StatelessWidget with ThemeUtils {
  final bool isActive, isSelected;
  double size;
  var duration = const Duration(milliseconds: 500);

  PaginationDot({
    super.key,
    this.isActive = false,
    this.isSelected = false,
    this.size = 50,
  });

  @override
  Widget build(BuildContext context) {
    initThemeUtils(context);
    return AnimatedScale(
      scale: isSelected ? 1 : 0.8,
      duration: duration,
      child: AnimatedContainer(
        duration: duration,
        height: size,
        width: size,
        decoration: BoxDecoration(
          color: isActive ? colorScheme.inversePrimary : colorScheme.inversePrimary.withOpacity(0.3),
          borderRadius: BorderRadius.circular(3.6.vw),
        ),
      ),
    );
  }
}

class PaginationLine extends StatelessWidget with ThemeUtils {
  double progress, height;

  PaginationLine({
    super.key,
    this.progress = 0,
    this.height = 10,
  }) {
    progress = progress.clamp(0, 1);
  }

  @override
  Widget build(BuildContext context) {
    initThemeUtils(context);
    return LayoutBuilder(builder: (context, constraints) {
      var maxWidth = constraints.maxWidth;
      if (maxWidth.isInfinite) maxWidth = 100;
      var activeWidth = maxWidth * progress;
      return Stack(
        children: [
          Container(
            height: height,
            width: maxWidth,
            decoration: BoxDecoration(
              color: colorScheme.inversePrimary.withOpacity(0.3),
              borderRadius: BorderRadius.circular(10.vw),
            ),
          ),
          Container(
            height: height,
            width: activeWidth,
            decoration: BoxDecoration(
              color: colorScheme.inversePrimary,
              borderRadius: BorderRadius.circular(3.6.vw),
            ),
          ),
        ],
      );
    });
  }
}
