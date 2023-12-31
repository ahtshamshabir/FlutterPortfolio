import 'dart:async';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_portfolio/sections/contact_section.dart';
import 'package:flutter_portfolio/sections/devices_section.dart';
import 'package:flutter_portfolio/sections/intro_section.dart';
import 'package:flutter_portfolio/sections/projects_section.dart';
import 'package:flutter_portfolio/sections/skills_section.dart';
import 'package:flutter_portfolio/sections/work_section.dart';
import 'package:flutter_portfolio/themes/theme_mode_provider.dart';
import 'package:flutter_portfolio/utils/dynamic_scaler.dart';
import 'package:flutter_portfolio/utils/responsive_system.dart';
import 'package:flutter_portfolio/utils/separate_widgets.dart';
import 'package:flutter_portfolio/utils/theme_utils.dart';
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
  int currentPage = 0, totalPages = 5;

  @override
  initState() {
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  double get pageViewMargin {
    if (deviceSizeType.isDesktop) {
      return 10.percentOf(deviceSize.width);
    } else {
      return 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return LayoutBuilder(builder: (context, constraints) {
      // print('deviceSizeType: $deviceSizeType');
      // print('deviceSize: $deviceSize');
      return Scaffold(
        backgroundColor: theme.colorScheme.background,
        body: Shortcuts(
          shortcuts: {
            LogicalKeySet(LogicalKeyboardKey.arrowUp): const ScrollIntent(direction: AxisDirection.up),
            LogicalKeySet(LogicalKeyboardKey.arrowDown): const ScrollIntent(direction: AxisDirection.down),
          },
          child: Actions(
            actions: {
              ScrollIntent: CallbackAction<ScrollIntent>(
                onInvoke: (intent) {
                  if (intent.direction == AxisDirection.down) {
                    if (currentPage < totalPages - 1) {
                      controller.animateToPage(
                        ++currentPage,
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.ease,
                      );
                    }
                  } else if (intent.direction == AxisDirection.up) {
                    if (currentPage > 0) {
                      controller.animateToPage(
                        --currentPage,
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.ease,
                      );
                    }
                  }
                  return null;
                },
              ),
            },
            child: Focus(
              autofocus: true,
              child: Stack(
                children: [
                  if (deviceSizeType.isDesktop)
                    Container(
                      key: const ValueKey('navbar'),
                      alignment: Alignment.centerLeft,
                      child: AppNavbar(controller: controller),
                    ),
                  Container(
                    key: const ValueKey('pageView'),
                    margin: EdgeInsets.only(left: pageViewMargin),
                    child: HomepageSections(
                      controller: controller,
                    ),
                  ),
                  AppHeader(),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}

class HomepageSections extends StatelessWidget {
  final PageController controller;

  const HomepageSections({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    var children = [
      IntroSection(key: const ValueKey('intro')),
      // DevicesSection(),
      WorkSection(key: const ValueKey('work')),
      SkillsSection(key: const ValueKey('skills')),
      ProjectsSection(key: const ValueKey('projects')),
      ContactSection(key: const ValueKey('contact')),
    ];
    if (deviceSizeType.isDesktop) {
      return CustomPageView(
        scrollDirection: Axis.vertical,
        controller: controller,
        duration: const Duration(milliseconds: 500),
        children: children,
      );
    } else {
      return PageView(
        scrollDirection: Axis.vertical,
        controller: controller,
        children: children,
      );
    }
  }
}

class CustomPageView extends StatefulWidget {
  final Axis scrollDirection;
  final PageController controller;
  final List<Widget> children;
  final Duration duration;

  const CustomPageView({
    super.key,
    required this.scrollDirection,
    required this.controller,
    required this.children,
    this.duration = const Duration(milliseconds: 500),
  });

  @override
  State<CustomPageView> createState() => _CustomPageViewState();
}

class _CustomPageViewState extends State<CustomPageView> {
  late PageController controller;
  Timer? timer;
  PanGestureRecognizer _gestureRecognizer = PanGestureRecognizer();

  @override
  void initState() {
    super.initState();
    controller = widget.controller;
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) {
        controller.position.isScrollingNotifier.addListener(snapToPage);
      },
    );
  }

  snapToPage() {
    var isScrolling = controller.position.isScrollingNotifier.value;

    if (!isScrolling) {
      timer = Timer(widget.duration, () {
        var page = controller.page?.round() ?? 0;
        controller.animateToPage(
          page,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      });
    } else {
      timer?.cancel();
    }
  }

  @override
  void dispose() {
    controller.position.isScrollingNotifier.removeListener(snapToPage);
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: widget.scrollDirection,
      controller: widget.controller,
      child: Column(
        children: [
          ...widget.children.map(
            (child) => Container(
              height: deviceSize.height,
              width: deviceSize.width,
              child: child,
            ),
          ),
        ],
      ),
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

class AppNavbar extends StatelessWidget with MediaQueryReadUtils {
  final PageController controller;

  AppNavbar({super.key, required this.controller});

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
    initQueryRead(context);
    var width = 10.percentOf(deviceSize.width);
    return ListenableBuilder(
      listenable: controller,
      builder: (context, _) {
        return Container(
          margin: const EdgeInsets.only(left: 20),
          width: width,
          child: Navbar(
            currentIndex: currentIndex,
            padding: EdgeInsets.all(10.percentOf(width)),
            iconSize: 60.percentOf(width),
            iconPadding: EdgeInsets.all(10.percentOf(width)),
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
          ),
        );
      },
    );
  }
}
