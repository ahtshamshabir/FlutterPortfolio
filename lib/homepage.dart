import 'package:flutter/material.dart';
import 'package:flutter_portfolio/sections/contact_section.dart';
import 'package:flutter_portfolio/sections/devices_section.dart';
import 'package:flutter_portfolio/sections/intro_section.dart';
import 'package:flutter_portfolio/sections/projects_section.dart';
import 'package:flutter_portfolio/sections/skills_section.dart';
import 'package:flutter_portfolio/sections/work_section.dart';
import 'package:flutter_portfolio/themes/theme_mode_provider.dart';
import 'package:flutter_portfolio/utils/separate_widgets.dart';
import 'package:flutter_portfolio/widgets/app_header.dart';
import 'package:flutter_portfolio/widgets/navbar.dart';
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
    var deviceSize = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            height: deviceSize.height,
            width: deviceSize.width,
            child: IntroSection(),
          ),
          Container(
            height: deviceSize.height,
            width: deviceSize.width,
            child: WorkSection(),
          ),
          Container(
            height: deviceSize.height,
            width: deviceSize.width,
            child: SkillsSection(),
          ),
          Container(
            height: deviceSize.height,
            width: deviceSize.width,
            child: ProjectsSection(),
          ),
          Container(
            height: deviceSize.height,
            width: deviceSize.width,
            child: ContactSection(),
          ),
        ]
      ),
    );
    return PageView(
      scrollDirection: Axis.vertical,
      physics: const CustomPageViewScrollPhysics(),
      controller: controller,
      children: [
        IntroSection(),
        // DevicesSection(),
        WorkSection(),
        SkillsSection(),
        ProjectsSection(),
        ContactSection(),
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

  VoidCallback bindPageCallback(int page) => () => goToPage(page);


  @override
  Widget build(BuildContext context) {
    var page = 0;
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
            // NavItem(
            //   title: 'Scroll animation',
            //   icon: Icons.devices,
            //   onPressed: () {
            //     goToPage(1);
            //   },
            // ),
            NavItem(
              title: 'Experience',
              icon: Icons.work,
              onPressed: () {
                goToPage(1);
              },
            ),
            NavItem(
              title: 'Skills',
              icon: Icons.assignment,
              onPressed: () {
                goToPage(2);
              },
            ),
            NavItem(
              title: 'Projects',
              icon: Icons.assignment_turned_in,
              onPressed: () {
                goToPage(3);
              },
            ),
            NavItem(
              title: 'Projects',
              icon: Icons.send,
              onPressed: () {
                goToPage(4);
              },
            ),
          ],
        );
      },
    );
  }
}
