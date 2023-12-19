import 'package:flutter/material.dart';
import 'package:flutter_portfolio/app.dart';
import 'package:flutter_portfolio/utils/svg_icons.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await cachePngs();
  runApp(const ProviderScope(child: App()));
}


