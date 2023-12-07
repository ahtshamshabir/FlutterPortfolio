import 'package:flutter/material.dart';
import 'package:flutter_portfolio/sections/devices_section.dart';
import 'package:flutter_portfolio/sections/intro_section.dart';
import 'package:flutter_portfolio/sections/skills_section.dart';
import 'package:flutter_portfolio/themes/theme_mode_provider.dart';
import 'package:flutter_portfolio/utils/separate_widgets.dart';
import 'package:flutter_portfolio/widgets/app_header.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key, required this.title});

  final String title;

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  var controller = PageController();

  @override
  initState() {
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.colorScheme.background,
      body: Stack(
        children: [
          Row(
            children: [
              AppNavbar(controller: controller),
              Expanded(
                child: HomepageSections(
                  controller: controller,
                ),
              ),
            ],
          ),
          AppHeader(),
        ],
      ),
    );
  }
}

class HomepageSections extends StatelessWidget {
  final PageController controller;

  const HomepageSections({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return PageView(
      scrollDirection: Axis.vertical,
      physics: const CustomPageViewScrollPhysics(),
      controller: controller,
      children: [
        SkillsSection(),
        IntroSection(),
        DevicesSection(),
        Container(
          height: double.infinity,
          width: double.infinity,
          color: Colors.yellow,
        ),
        Container(
          height: double.infinity,
          width: double.infinity,
          color: Colors.purple,
        ),
        Container(
          height: double.infinity,
          width: double.infinity,
          color: Colors.orange,
        ),
        Container(
          height: double.infinity,
          width: double.infinity,
          color: Colors.red,
        ),
        Container(
          height: double.infinity,
          width: double.infinity,
          color: Colors.greenAccent,
        ),
      ],
    );
  }
}

class CustomPageViewScrollPhysics extends ScrollPhysics {
  const CustomPageViewScrollPhysics({ScrollPhysics? parent}) : super(parent: parent);

  @override
  CustomPageViewScrollPhysics applyTo(ScrollPhysics? ancestor) {
    return CustomPageViewScrollPhysics(parent: buildParent(ancestor)!);
  }

  @override
  SpringDescription get spring => const SpringDescription(
        mass: 100,
        stiffness: 100,
        damping: 0.8,
      );
}

class Navbar extends StatelessWidget {
  List<NavItem> items;
  int currentIndex;

  Navbar({super.key, required this.currentIndex, this.items = const []});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var colorScheme = theme.colorScheme;
    return Container(
      margin: const EdgeInsets.only(left: 20),
      child: Ink(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: colorScheme.surface,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ...separateWidgets(
              [
                for (int i = 0; i < items.length; i++)
                  Tooltip(
                    message: items[i].title,
                    textStyle: theme.textTheme.bodySmall!.copyWith(color: colorScheme.onBackground),
                    margin: const EdgeInsets.only(left: 130),
                    verticalOffset: 0,
                    decoration: ShapeDecoration(
                      color: colorScheme.background,
                      //todo: add a custom shape here for tooltip
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    waitDuration: const Duration(milliseconds: 0),
                    child: InkWell(
                      onTap: items[i].onPressed,
                      borderRadius: BorderRadius.circular(20),
                      child: Ink(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: i == currentIndex ? colorScheme.background : null,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Icon(
                          items[i].icon,
                          color: colorScheme.onBackground,
                          size: 60,
                        ),
                      ),
                    ),
                  ),
              ],
              const SizedBox(height: 10),
            ),
          ],
        ),
      ),
    );
  }
}

class NavItem {
  final String title;
  final IconData icon;
  Function()? onPressed;

  NavItem({
    required this.title,
    required this.icon,
    this.onPressed,
  });
}

class AppNavbar extends StatelessWidget {
  final PageController controller;

  const AppNavbar({super.key, required this.controller});

  goToPage(int index) {
    controller.animateToPage(
      index,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  int get currentIndex {
    if (controller.hasClients) {
      return controller.page?.round() ?? 0;
    } else {
      return 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: controller,
      builder: (context, _) {
        return Navbar(
          currentIndex: currentIndex,
          items: [
            NavItem(
              title: 'Intro',
              icon: Icons.person,
              onPressed: () {
                goToPage(0);
              },
            ),
            NavItem(
              title: 'Scroll animation',
              icon: Icons.devices,
              onPressed: () {
                goToPage(1);
              },
            ),
            NavItem(
              title: 'About',
              icon: Icons.info,
              onPressed: () {
                goToPage(2);
              },
            ),
            NavItem(
              title: 'Experience',
              icon: Icons.work,
              onPressed: () {
                goToPage(3);
              },
            ),
            NavItem(
              title: 'Skills',
              icon: Icons.assignment,
              onPressed: () {
                goToPage(4);
              },
            ),
            NavItem(
              title: 'Projects',
              icon: Icons.assignment_turned_in,
              onPressed: () {
                goToPage(5);
              },
            ),
          ],
        );
      },
    );
  }
}
