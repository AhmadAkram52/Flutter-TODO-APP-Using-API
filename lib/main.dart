import 'package:flutter/material.dart';
import 'package:todo/Utils/Themes/ttheme.dart';
import 'package:todo/Views/splash_screen.dart';

void main() {
  runApp(const ToDo());
}

class ToDo extends StatelessWidget {
  const ToDo({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.system,
      theme: TTheme.lightTheme,
      darkTheme: TTheme.darkTheme,
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
    );
  }
}
