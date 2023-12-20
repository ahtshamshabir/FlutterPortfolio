import 'package:flutter/material.dart';
import 'package:flutter_portfolio/utils/dynamic_scaler.dart';
import 'package:flutter_portfolio/utils/dynamic_scaler.dart';
import 'package:flutter_portfolio/utils/font_family.dart';
import 'package:flutter_portfolio/utils/svg_icons.dart';
import 'package:flutter_portfolio/utils/svg_to_png.dart';
import 'package:flutter_portfolio/utils/theme_utils.dart';

import '../utils/responsive_system.dart';

class IntroSection extends StatelessWidget with ThemeUtils, MediaQueryReadUtils {
  IntroSection({super.key});

  Alignment get infoAlignment {
    if(deviceSizeType.isSmall) {
      return const Alignment(-1, -0.7);
    }
    else if(deviceSizeType.isMedium) {
      return const Alignment(-1, -0.6);
    }
    else {
      return Alignment.centerLeft;
    }
  }

  Alignment get avatarAlignment {
    if(deviceSizeType.isSmall) {
      return const Alignment(1, 0.8);
    }
    else if(deviceSizeType.isMedium) {
      return const Alignment(1, 0.6);
    }
    else {
      return Alignment.centerRight;
    }
  }

  double get avatarSize {
    if(deviceSizeType.isSmall) {
      return 70.vw;
    }else if(deviceSizeType.isMedium) {
      return 50.vw;
    }
    else {
      return 34.vw;
    }
  }

  @override
  Widget build(BuildContext context) {
    initThemeUtils(context);
    initQueryRead(context);
    return Ink(
      height: double.infinity,
      width: double.infinity,
      color: colorScheme.background,
      padding: EdgeInsets.only(left: 5.2.vw, right: 7.vw, top: 120, bottom: 120),
      child: Stack(
        children: [
          AnimatedAlign(
            alignment: infoAlignment,
            duration: const Duration(milliseconds: 500),
            curve: Curves.ease,
            child: InfoSection(),
          ),
          AnimatedAlign(
            alignment: avatarAlignment,
            duration: const Duration(milliseconds: 500),
            curve: Curves.ease,
            child: Container(
              height: avatarSize,
              width: avatarSize,
              child: AvatarSection(),
            ),
          ),
        ],
      ),
    );
  }
}

class InfoSection extends StatelessWidget with ThemeUtils {
  @override
  Widget build(BuildContext context) {
    initThemeUtils(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          '''Column(
  children: [''',
          style: textTheme.bodyLarge!.copyWith(
            fontFamily: FontFamily.sourceCodePro,
            color: colorScheme.onBackground.withOpacity(0.25),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 60),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'Raja',
                      style: textTheme.displayLarge?.copyWith(
                        fontWeight: FontWeight.w200,
                      ),
                    ),
                    TextSpan(
                      text: ' ',
                      style: textTheme.displayLarge,
                    ),
                    TextSpan(
                      text: 'Ahtsham Shabir',
                      style: textTheme.displayLarge?.copyWith(
                        color: colorScheme.primary,
                      ),
                    ),
                  ],
                  style: textTheme.headlineLarge,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                'Software Engineer',
                style: textTheme.headlineMedium,
              ),
              const SizedBox(height: 10),
              Text(
                'I believe anything is possible with Flutter.',
                style: textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
        Text(
          '''  ],
);''',
          style: textTheme.bodyLarge?.copyWith(
            fontFamily: FontFamily.sourceCodePro,
            color: colorScheme.onBackground.withOpacity(0.25),
          ),
        ),
      ],
    );
  }
}

class AvatarSection extends StatelessWidget with ThemeUtils {
  AvatarSection({super.key});

  @override
  Widget build(BuildContext context) {
    initThemeUtils(context);
    return LayoutBuilder(
      builder: (context, constaints) {
        var maxWidth = constaints.maxWidth;
        var maxHeight = constaints.maxHeight;
        return Container(
          height: maxHeight,
          width: maxWidth,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Container(
                height: 82.percentOf(maxWidth),
                width: 82.percentOf(maxWidth),
                padding: EdgeInsets.all(8.8.percentOf(maxWidth)),
                decoration: BoxDecoration(
                  color: colorScheme.surface,
                  borderRadius: BorderRadius.circular(58.82.percentOf(maxWidth)),
                ),
                child: Container(
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/flutter-dash.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 2.35.percentOf(maxWidth),
                top: 32.35.percentOf(maxWidth),
                child: Container(
                  height: 16.64.percentOf(maxWidth),
                  width: 16.64.percentOf(maxWidth),
                  decoration: BoxDecoration(
                    color: colorScheme.tertiary,
                    borderRadius: BorderRadius.circular(58.82.percentOf(maxWidth)),
                  ),
                ),
              ),
              Positioned(
                right: 2.35.percentOf(maxWidth),
                top: 14.7.percentOf(maxWidth),
                child: Container(
                  height: 23.7.percentOf(maxWidth),
                  width: 23.7.percentOf(maxWidth),
                  decoration: BoxDecoration(
                    color: colorScheme.inversePrimary,
                    borderRadius: BorderRadius.circular(58.82.percentOf(maxWidth)),
                  ),
                ),
              ),
              Positioned(
                left: 44.11.percentOf(maxWidth),
                bottom: 0,
                child: Container(
                  height: 17.52.percentOf(maxWidth),
                  width: 17.52.percentOf(maxWidth),
                  decoration: BoxDecoration(
                    color: colorScheme.inverseSurface,
                    borderRadius: BorderRadius.circular(58.82.percentOf(maxWidth)),
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
