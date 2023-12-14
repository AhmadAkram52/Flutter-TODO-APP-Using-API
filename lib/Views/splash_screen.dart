import 'dart:async';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:todo/Utils/tcolors.dart';
import 'package:todo/Views/list_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(const Duration(seconds: 6), () {
      navigateToListScreen();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: DefaultTextStyle(
              style: const TextStyle(
                color: TColors.primaryColor,
                fontSize: 100.0,
              ),
              child: Center(
                child: AnimatedTextKit(
                  repeatForever: true,
                  animatedTexts: [
                    TyperAnimatedText(
                      speed: const Duration(milliseconds: 300),
                      textStyle: const TextStyle(fontFamily: 'Abril'),
                      'TODO',
                    ),
                    WavyAnimatedText(
                      'TODO',
                      textStyle: const TextStyle(fontFamily: 'Abril'),
                      speed: const Duration(milliseconds: 300),
                    ),
                    ColorizeAnimatedText(
                      'TODO',
                      colors: TColors.colorizeColors,
                      textStyle:
                          const TextStyle(fontSize: 100, fontFamily: 'Abril'),
                      speed: const Duration(milliseconds: 500),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  void navigateToListScreen() {
    final route =
        MaterialPageRoute(builder: (context) => const TodoListScreen());
    Navigator.pushReplacement(context, route);
  }
}
