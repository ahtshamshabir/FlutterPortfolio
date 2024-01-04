import 'package:flutter/material.dart';
import 'package:flutter_portfolio/app.dart';
import 'package:flutter_portfolio/utils/svg_icons.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var brightness = WidgetsBinding.instance.platformDispatcher.platformBrightness;
  // if (brightness == Brightness.dark) {
  //   setDarkSystemUIOverlayStyle();
  // } else {
  //   setLightSystemUIOverlayStyle();
  // }
  await cachePngs();
  runApp(ProviderScope(child: App()));
}


