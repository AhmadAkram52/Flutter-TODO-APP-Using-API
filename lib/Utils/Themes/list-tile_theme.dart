import 'package:flutter/material.dart';

class TListTimeTheme {
  static final ListTileThemeData lightTileTheme = ListTileThemeData(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
      side: const BorderSide(color: Colors.black),
    ),
    contentPadding: const EdgeInsets.only(left: 5),
  );
  static final ListTileThemeData darkTileTheme = ListTileThemeData(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
      side: const BorderSide(color: Colors.white),
    ),
    contentPadding: const EdgeInsets.only(left: 5),
  );
}
