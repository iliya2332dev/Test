
// ignore_for_file: avoid_web_libraries_in_flutter



import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_app/splashScreen.dart';
import 'package:test_app/theme/theme_provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(create: (context) => ThemeProvider(),
    child: const App(),)
  );
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const SplashScreen(), 
      theme: Provider.of<ThemeProvider>(context).themeData,
      );
  }
}
