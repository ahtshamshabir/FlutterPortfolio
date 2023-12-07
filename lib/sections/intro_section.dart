import 'package:flutter/material.dart';
import 'package:flutter_portfolio/utils/dynamic_scaler.dart';
import 'package:flutter_portfolio/utils/dynamic_scaler.dart';
import 'package:flutter_portfolio/utils/font_family.dart';
import 'package:flutter_portfolio/utils/theme_utils.dart';

class IntroSection extends StatelessWidget with ThemeUtils {
  IntroSection({super.key});

  @override
  Widget build(BuildContext context) {
    initThemeUtils(context);
    return Ink(
      height: double.infinity,
      width: double.infinity,
      color: colorScheme.background,
      padding: const EdgeInsets.only(left: 100, right: 150),
      child: Row(
        children: [
          InfoSection(),
          const Spacer(),
          AvatarSection(),
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
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          '''Column(
  children: [''',
          style: textTheme.bodyMedium!.copyWith(
            fontFamily: FontFamily.sourceCodePro,
            fontSize: 30,
            color: Colors.white.withOpacity(0.25),
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
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: FontFamily.inter,
                        fontWeight: FontWeight.w200,
                        fontSize: 50,
                      ),
                    ),
                    const TextSpan(
                      text: ' ',
                      style: TextStyle(
                        fontWeight: FontWeight.w100,
                        fontSize: 50,
                      ),
                    ),
                    TextSpan(
                      text: 'Ahtsham Shabir',
                      style: TextStyle(
                        color: Colors.blue,
                        fontFamily: FontFamily.inter,
                        fontWeight: FontWeight.w400,
                        fontSize: 50,
                      ),
                    ),
                  ],
                  style: textTheme.headlineLarge,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Software Engineer',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 33,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'I believe anything is possible with Flutter.',
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 33,
                ),
              ),
            ],
          ),
        ),
        Text(
          '''  ],
);''',
          style: textTheme.bodyMedium!.copyWith(
            fontFamily: FontFamily.sourceCodePro,
            fontSize: 30,
            color: Colors.white.withOpacity(0.25),
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
    return Container(
      height: 34.vw,
      width: 34.vw,
      // color: Colors.red,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            height: 28.vw,
            width: 28.vw,
            padding: EdgeInsets.all(3.vw),
            decoration: BoxDecoration(
              color: colorScheme.surface,
              borderRadius: BorderRadius.circular(20.vw),
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
            left: 0.8.vw,
            top: 11.vw,
            child: Container(
              height: 6.vw,
              width: 6.vw,
              decoration: BoxDecoration(
                color: colorScheme.tertiary,
                borderRadius: BorderRadius.circular(20.vw),
              ),
            ),
          ),
          Positioned(
            right: 0.8.vw,
            top: 5.vw,
            child: Container(
              height: 8.4.vw,
              width: 8.4.vw,
              decoration: BoxDecoration(
                color: colorScheme.inversePrimary,
                borderRadius: BorderRadius.circular(20.vw),
              ),
            ),
          ),
          Positioned(
            left: 0.8.vw,
            top: 11.vw,
            child: Container(
              height: 6.vw,
              width: 6.vw,
              decoration: BoxDecoration(
                color: colorScheme.tertiary,
                borderRadius: BorderRadius.circular(20.vw),
              ),
            ),
          ),
          Positioned(
            left: 15.vw,
            bottom: 0.vw,
            child: Container(
              height: 6.3.vw,
              width: 6.3.vw,
              decoration: BoxDecoration(
                color: colorScheme.inverseSurface,
                borderRadius: BorderRadius.circular(20.vw),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
