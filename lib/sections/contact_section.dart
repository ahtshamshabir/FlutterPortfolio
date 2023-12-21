import 'package:flutter/material.dart';
import 'package:flutter_portfolio/utils/dynamic_scaler.dart';
import 'package:flutter_portfolio/utils/theme_utils.dart';
import 'package:flutter_portfolio/widgets/section_wrapper.dart';

class ContactSection extends StatelessWidget with ThemeUtils {
  ContactSection({super.key});

  @override
  Widget build(BuildContext context) {
    initThemeUtils(context);
    return SectionWrapper(
      child: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          color: colorScheme.surfaceVariant,
          borderRadius: BorderRadius.circular(30),
        ),
        padding: EdgeInsets.all(1.vw).copyWith(top: 2.vw),
        child: Column(
          children: [
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'Interested in working',
                    style: textTheme.headlineLarge,
                  ),
                  TextSpan(
                    text: ' ',
                    style: textTheme.headlineLarge,
                  ),
                  TextSpan(
                    text: 'Together',
                    style: textTheme.headlineLarge?.copyWith(
                      color: colorScheme.primary,
                    ),
                  ),
                  TextSpan(
                    text: '?',
                    style: textTheme.headlineLarge,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 100),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20.vw),
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
                  const SizedBox(height: 40),
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
                  const SizedBox(height: 40),
                  TextFormField(
                    maxLines: 5,
                    decoration: const InputDecoration(
                      label: Text(
                        'Your Message',
                      ),
                      alignLabelWithHint: true,
                    ),
                  ),
                  const SizedBox(height: 40),
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
