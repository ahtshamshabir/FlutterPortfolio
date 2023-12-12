import 'package:flutter/material.dart';
import 'package:flutter_portfolio/utils/dynamic_scaler.dart';
import 'package:flutter_portfolio/utils/svg_icons.dart';
import 'package:flutter_portfolio/utils/theme_utils.dart';
import 'package:flutter_portfolio/widgets/section_surface.dart';
import 'package:flutter_svg/flutter_svg.dart';

class WorkSection extends StatelessWidget with ThemeUtils {
  WorkSection({super.key});

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
              Center(
                child: PaginationDots(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PaginationDots extends StatelessWidget {
  Widget dot([bool isSelected = false]) {
    return Container(
      height: 3.6.vw,
      width: 3.6.vw,
      decoration: BoxDecoration(
        color: isSelected ? const Color(0xFF786CFF) : const Color(0xFF786CFF).withOpacity(0.3),
        borderRadius: BorderRadius.circular(3.6.vw),
      ),
    );
  }

  Widget line() {
    return Container(
      height: 0.6.vw,
      width: 7.2.vw,
      decoration: BoxDecoration(
        color: const Color(0xFF786CFF).withOpacity(0.3),
        borderRadius: BorderRadius.circular(3.6.vw),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          dot(true),
          SizedBox(width: 0.5.vw),
          line(),
          SizedBox(width: 0.5.vw),
          dot(),
          SizedBox(width: 0.5.vw),
          line(),
          SizedBox(width: 0.5.vw),
          dot(),
          SizedBox(width: 0.5.vw),
          line(),
          SizedBox(width: 0.5.vw),
          dot(),
        ],
      ),
    );
  }
}
