import 'package:flutter/material.dart';
import 'package:todo/Utils/tcolors.dart';

class BtnThemes {
  static const FloatingActionButtonThemeData lightFloatingBtn =
      FloatingActionButtonThemeData(
    elevation: 30,
    backgroundColor: TColors.primaryColor,
  );
  static const FloatingActionButtonThemeData darkFloatingBtn =
      FloatingActionButtonThemeData(
    elevation: 30,
    backgroundColor: TColors.primaryColor,
  );

  static ElevatedButtonThemeData lightElevatedBtn = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
        elevation: 30,
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 50),
        backgroundColor: TColors.primaryColor),
  );
  static ElevatedButtonThemeData darkElevatedBtn = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
        elevation: 30,
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 50),
        backgroundColor: TColors.primaryColor),
  );
}
