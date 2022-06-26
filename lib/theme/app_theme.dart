import 'package:flutter/material.dart';
import 'package:material_color_generator/material_color_generator.dart';

enum ThemeType { light, dark }

class AppTheme {
  static final MaterialColor mainColor =
      generateMaterialColor(color: const Color(0xff195860));

  static ThemeType themeType = ThemeType.dark;

  static ThemeData theme = getTheme();

  static ThemeData getTheme({ThemeType? themeType}) {
    themeType = themeType ?? AppTheme.themeType;
    if (themeType == ThemeType.light) return lightTheme;
    return darkTheme;
  }

  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: mainColor,
    primarySwatch: mainColor,
    appBarTheme:
        const AppBarTheme(elevation: 0, backgroundColor: Colors.transparent),
    inputDecorationTheme: InputDecorationTheme(
      border: InputBorder.none,
      floatingLabelBehavior: FloatingLabelBehavior.always,
      fillColor: Colors.grey.shade200,
      filled: true
    ),
    //textTheme: TextTheme(bodyText2: TextStyle(color: Colors.black))
  );

  static final ThemeData darkTheme = ThemeData(
      brightness: Brightness.dark,
      primaryColor: mainColor,
      primarySwatch: mainColor,
      tabBarTheme: const TabBarTheme(
        indicator: UnderlineTabIndicator(
          borderSide: BorderSide(color: Colors.white, width: 3),
          //insets: EdgeInsets.only(right: 60)
        ),
      ),
      appBarTheme: const AppBarTheme(color: Color(0xff195860)),
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Colors.white),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Colors.white),
        ),
        labelStyle: const TextStyle(color: Colors.white),
      ),
      hintColor: Colors.white,
      scaffoldBackgroundColor: mainColor,
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          primary: mainColor.shade400,
          onPrimary: Colors.white,
        ),
      ),
      dividerTheme: DividerThemeData(color: mainColor.shade400, thickness: 3));
}
