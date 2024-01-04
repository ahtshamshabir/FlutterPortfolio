import 'package:flutter/material.dart';
import 'package:flutter_portfolio/utils/dynamic_scaler.dart';
import 'package:flutter_portfolio/utils/dynamic_scaler.dart';
import 'package:flutter_portfolio/utils/font_family.dart';
import 'package:flutter_portfolio/utils/svg_icons.dart';
import 'package:flutter_portfolio/utils/svg_to_png.dart';
import 'package:flutter_portfolio/utils/theme_utils.dart';

import '../utils/responsive_system.dart';

const avatarSizeMap = <DeviceSizeType, double>{
  DeviceSizeType.desktopSmall: 60,
  DeviceSizeType.desktopMedium: 35,
  DeviceSizeType.desktopLarge: 34,
  DeviceSizeType.desktopXLarge: 34,
  DeviceSizeType.mobileLarge: 70,
  DeviceSizeType.mobileMedium: 70,
  DeviceSizeType.mobileSmall: 70,
};

const infoAlignmentMap = <DeviceSizeType, Alignment>{
  DeviceSizeType.desktopSmall: Alignment(-1, -0.8),
  DeviceSizeType.desktopMedium: Alignment(-1, -0.6),
  DeviceSizeType.desktopLarge: Alignment.centerLeft,
  DeviceSizeType.desktopXLarge: Alignment.centerLeft,
  DeviceSizeType.mobileLarge: Alignment(-1, -0.5),
  DeviceSizeType.mobileMedium: Alignment(-1, -0.5),
  DeviceSizeType.mobileSmall: Alignment(-1, -0.5),
};

const avatarAlignmentMap = <DeviceSizeType, Alignment>{
  DeviceSizeType.desktopSmall: Alignment(1, 1),
  DeviceSizeType.desktopMedium: Alignment(1, 1),
  DeviceSizeType.desktopLarge: Alignment.centerRight,
  DeviceSizeType.desktopXLarge: Alignment.centerRight,
  DeviceSizeType.mobileLarge: Alignment(1, 0.8),
  DeviceSizeType.mobileMedium: Alignment(1, 1),
  DeviceSizeType.mobileSmall: Alignment(1, 1),
};

class IntroSection extends StatelessWidget with ThemeUtils {
  IntroSection({super.key});

  Alignment get infoAlignment {
    return infoAlignmentMap[deviceSizeType]!;
  }

  Alignment get avatarAlignment {
    return avatarAlignmentMap[deviceSizeType]!;
  }

  double get avatarSize {
    return avatarSizeMap[deviceSizeType]!.vw;
  }

  double get infoSectionMargin {
    if (deviceSizeType.isMobile) {
      return 30;
    } else {
      return 0;
    }
  }

  double get verticalPadding {
    if (deviceSizeType.isDesktop) {
      return 17.vh;
    } else {
      return 5.vh;
    }
  }

  @override
  Widget build(BuildContext context) {
    initThemeUtils(context);
    return Ink(
      height: double.infinity,
      width: double.infinity,
      color: colorScheme.background,
      padding: EdgeInsets.only(left: 3.vw, right: 7.vw, top: verticalPadding, bottom: verticalPadding),
      child: Stack(
        children: [
          AnimatedContainer(
            alignment: infoAlignment,
            duration: const Duration(milliseconds: 500),
            margin: EdgeInsets.only(right: infoSectionMargin),
            curve: Curves.ease,
            child: FittedBox(
              child: InfoSection(),
            ),
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
          padding: const EdgeInsets.only(left: 30),
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
          ''' ],
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
