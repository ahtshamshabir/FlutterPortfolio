import 'package:flutter/material.dart';
import 'package:flutter_portfolio/utils/dynamic_scaler.dart';
import 'package:flutter_portfolio/utils/global_context.dart';

ValueNotifier<AppLifecycleState> appState = ValueNotifier(AppLifecycleState.resumed);

class GlobalContextInitializer extends StatefulWidget {
  final Widget child;

  const GlobalContextInitializer({super.key, required this.child});

  @override
  State<GlobalContextInitializer> createState() => _GlobalContextInitializerState();
}

class _GlobalContextInitializerState extends State<GlobalContextInitializer> {
  bool initialized = false;

  initializeOperations(BuildContext context) async {
    var mediaQuery = MediaQuery.of(context);
    setDeviceSize(mediaQuery.size);
    globalContext = context;
    await Future.delayed(const Duration(milliseconds: 100));
    setState(() {
      initialized = true;
    });
  }

  refreshOperations(BuildContext context) {
    globalContext = context;
    var mediaQuery = MediaQuery.of(context);
    setDeviceSize(mediaQuery.size);
  }

  void checkForUpdate(BuildContext context) async {}

  @override
  void dispose() {
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    if (!initialized) {
      initializeOperations(context);
      return Container();
    }
    refreshOperations(context);
    return widget.child;
  }
}
