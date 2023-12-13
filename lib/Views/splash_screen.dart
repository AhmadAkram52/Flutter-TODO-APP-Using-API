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
    Timer(const Duration(seconds: 9), () {
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
                      speed: const Duration(milliseconds: 500),
                      textStyle: const TextStyle(),
                      'TODO',
                    ),
                    WavyAnimatedText(
                      'TODO',
                      speed: const Duration(milliseconds: 500),
                    ),
                    ColorizeAnimatedText(
                      'TODO',
                      colors: TColors.colorizeColors,
                      textStyle: const TextStyle(fontSize: 100),
                      speed: const Duration(seconds: 1),
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
