import 'package:flutter/material.dart';
import 'package:todo/Utils/Themes/appbar_theme.dart';
import 'package:todo/Utils/Themes/btns_themes.dart';
import 'package:todo/Utils/Themes/list-tile_theme.dart';
import 'package:todo/Utils/Themes/text_theme.dart';
import 'package:todo/Utils/Themes/textfield_theme.dart';

class TTheme {
  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    useMaterial3: true,
    // fontFamily: 'Abril',
    floatingActionButtonTheme: BtnThemes.lightFloatingBtn,
    appBarTheme: TAppBarTheme.lightAppbar,
    inputDecorationTheme: TextFieldTheme.lightTextField,
    elevatedButtonTheme: BtnThemes.lightElevatedBtn,
    listTileTheme: TListTimeTheme.lightTileTheme,
    textTheme: TTextTheme.lightTextTheme,
    popupMenuTheme: PopupMenuThemeData(
      elevation: 30,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
    ),
  );

  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    useMaterial3: true,
    // fontFamily: 'Abril',
    floatingActionButtonTheme: BtnThemes.darkFloatingBtn,
    appBarTheme: TAppBarTheme.darkAppbar,
    inputDecorationTheme: TextFieldTheme.darkTextField,
    elevatedButtonTheme: BtnThemes.darkElevatedBtn,
    listTileTheme: TListTimeTheme.darkTileTheme,
    textTheme: TTextTheme.darkTextTheme,
    popupMenuTheme: PopupMenuThemeData(
      elevation: 30,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
    ),
  );
}
