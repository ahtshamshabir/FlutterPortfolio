import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_portfolio/homepage.dart';
import 'package:flutter_portfolio/themes/dark_theme.dart';
import 'package:flutter_portfolio/themes/light_theme.dart';
import 'package:flutter_portfolio/themes/theme_mode_provider.dart';
import 'package:flutter_portfolio/utils/theme_utils.dart';
import 'package:flutter_portfolio/widgets/global_context_initializer.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

setDarkSystemUIOverlayStyle() {
  SystemUiOverlayStyle systemUiOverlayStyle = SystemUiOverlayStyle(
    statusBarColor: darkColorScheme.background,
    statusBarIconBrightness: Brightness.light,
    systemNavigationBarColor: Colors.transparent,
    systemNavigationBarIconBrightness: Brightness.light,
  );
  SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
}

setLightSystemUIOverlayStyle() {
  SystemUiOverlayStyle systemUiOverlayStyle = SystemUiOverlayStyle(
    statusBarColor: lightColorScheme.background,
    statusBarIconBrightness: Brightness.dark,
    systemNavigationBarColor: Colors.transparent,
    systemNavigationBarIconBrightness: Brightness.dark,
  );
  SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
}

class App extends ConsumerWidget with MediaQueryReadUtils {
  App({super.key});

  setSystemUIOverlayStyle(ThemeMode mode) {
    if (mode == ThemeMode.system) {
      print('system: $mode');
      var brightness = mediaQuery.platformBrightness;
      if (brightness == Brightness.dark) {
        mode = ThemeMode.dark;
      } else {
        mode = ThemeMode.light;
      }
    }
    print('mode: $mode');
    if (mode == ThemeMode.dark) {
      print('dark: $mode');
      setDarkSystemUIOverlayStyle();
    } else {
      print('light: $mode');
      setLightSystemUIOverlayStyle();
    }
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, ref) {
    var themeMode = ref.watch(themeModeProvider);
    initQueryRead(context);
    // print('themeMode: $themeMode');
    setSystemUIOverlayStyle(themeMode);
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
