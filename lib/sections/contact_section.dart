import 'package:flutter/material.dart';
import 'package:flutter_portfolio/utils/dynamic_scaler.dart';
import 'package:flutter_portfolio/utils/theme_utils.dart';
import 'package:flutter_portfolio/widgets/section_wrapper.dart';

class ContactSection extends StatelessWidget with ThemeUtils {
  ContactSection({super.key});

  double get sectionPadding {
    if (deviceSizeType.isDesktop) return 120;
    return 70;
  }

  double get formPadding {
    if (deviceSizeType.isDesktop) return 20.vw;
    return 5.vw;
  }

  double get headingSpacing {
    if (deviceSizeType.isDesktop) return 100;
    return 50;
  }

  double get inputSpacing {
    if (deviceSizeType.isDesktop) return 40;
    return 20;
  }

  double get headingPaddingTop {
    if (deviceSizeType.isDesktop) return 2.vw;
    return 20;
  }

  @override
  Widget build(BuildContext context) {
    initThemeUtils(context);
    return SectionWrapper(
      padding: EdgeInsets.symmetric(horizontal: 5.vw, vertical: sectionPadding),
      child: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          color: colorScheme.surfaceVariant,
          borderRadius: BorderRadius.circular(30),
        ),
        padding: EdgeInsets.all(1.vw).copyWith(top: headingPaddingTop),
        child: Column(
          children: [
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'Interested in working',
                    style: textTheme.headlineLarge!.scaleMinMax(min: 20, max: 40),
                  ),
                  TextSpan(
                    text: ' ',
                    style: textTheme.headlineLarge!.scaleMinMax(min: 20, max: 40),
                  ),
                  TextSpan(
                    text: 'Together',
                    style: textTheme.headlineLarge?.copyWith(
                      color: colorScheme.primary,
                    ).scaleMinMax(min: 20, max: 40),
                  ),
                  TextSpan(
                    text: '?',
                    style: textTheme.headlineLarge!.scaleMinMax(min: 20, max: 40),
                  ),
                ],
              ),
            ),
            SizedBox(height: headingSpacing),
            Container(
              padding: EdgeInsets.symmetric(horizontal: formPadding),
              child: Column(
                children: [
                  TextFormField(
                    decoration: const InputDecoration(
                      label: Text(
                        'Your Email Address',
                      ),
                      prefixIconConstraints: BoxConstraints(
                        minWidth: 60,
                        minHeight: 0,
                      ),
                      prefixIcon: Icon(
                        Icons.email_outlined,
                      ),
                    ),
                  ),
                  SizedBox(height: inputSpacing),
                  TextFormField(
                    decoration: const InputDecoration(
                      label: Text(
                        'Your Phone Number',
                      ),
                      prefixIconConstraints: BoxConstraints(
                        minWidth: 60,
                        minHeight: 0,
                      ),
                      prefixIcon: Icon(
                        Icons.phone_iphone,
                      ),
                    ),
                  ),
                  SizedBox(height: inputSpacing),
                  TextFormField(
                    maxLines: 5,
                    decoration: const InputDecoration(
                      label: Text(
                        'Your Message',
                      ),
                      alignLabelWithHint: true,
                    ),
                  ),
                  SizedBox(height: inputSpacing),
                  FilledButton(
                    key: const ValueKey('send'),
                    onPressed: () {
                      print('send tapped');
                    },
                    style: const ButtonStyle(
                      padding: MaterialStatePropertyAll(EdgeInsets.fromLTRB(35, 20, 15, 20)),
                    ),
                    child: const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text('Send'),
                        SizedBox(width: 10),
                        Icon(
                          Icons.send,
                          size: 18,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
