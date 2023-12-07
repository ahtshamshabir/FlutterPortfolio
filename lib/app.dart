import 'package:flutter/material.dart';
import 'package:flutter_portfolio/homepage.dart';
import 'package:flutter_portfolio/themes/dark_theme.dart';
import 'package:flutter_portfolio/themes/light_theme.dart';
import 'package:flutter_portfolio/themes/theme_mode_provider.dart';
import 'package:flutter_portfolio/widgets/global_context_initializer.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class App extends ConsumerWidget {
  const App({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, ref) {
    var themeMode = ref.watch(themeModeProvider);
    // print('themeMode: $themeMode');
    return MaterialApp(
      title: 'Flutter Demo',
      theme: lightThemeData,
      darkTheme: darkThemeData,
      themeMode: themeMode,
      home: const GlobalContextInitializer(
        child: Homepage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}
