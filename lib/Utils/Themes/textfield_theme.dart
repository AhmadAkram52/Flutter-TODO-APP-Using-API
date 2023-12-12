import 'package:flutter/material.dart';

import '../tcolors.dart';

class TextFieldTheme {
  static final InputDecorationTheme lightTextField = InputDecorationTheme(
    enabledBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.black),
      borderRadius: BorderRadius.circular(20),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: TColors.primaryColor, width: 2),
      borderRadius: BorderRadius.circular(20),
    ),
    errorBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.red),
      borderRadius: BorderRadius.circular(20),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: TColors.primaryColor, width: 2),
      borderRadius: BorderRadius.circular(20),
    ),
    errorStyle: const TextStyle(color: Colors.red),
  );

  static final InputDecorationTheme darkTextField = InputDecorationTheme(
    enabledBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.white),
      borderRadius: BorderRadius.circular(20),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: TColors.primaryColor, width: 2),
      borderRadius: BorderRadius.circular(20),
    ),
    errorBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.red),
      borderRadius: BorderRadius.circular(20),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: TColors.primaryColor, width: 2),
      borderRadius: BorderRadius.circular(20),
    ),
    errorStyle: const TextStyle(color: Colors.red),
  );
}
