import 'package:animations/animations.dart';
import 'package:flutter/material.dart';

const primaryColor = Color.fromRGBO(28, 20, 100, 1);
const secondaryColor = Color.fromRGBO(8, 70, 145, 1);

ThemeData theme() {
  return ThemeData(
    brightness: Brightness.light,
    fontFamily: 'Nunito',
    primaryColor: primaryColor,
    backgroundColor: Colors.white,
    appBarTheme: const AppBarTheme().copyWith(
      backgroundColor: Colors.grey[50],
      centerTitle: true,
      elevation: 0,
      foregroundColor: primaryColor,
    ),
    bottomAppBarTheme: const BottomAppBarTheme().copyWith(
      color: Colors.white,
      elevation: 0,
    ),
    colorScheme: const ColorScheme.light().copyWith(
      background: Colors.white,
      error: Colors.red,
      onBackground: Colors.black,
      onError: Colors.black,
      primary: primaryColor,
      onPrimary: Colors.white,
      secondary: secondaryColor,
      onSecondary: Colors.white,
      surface: const Color.fromRGBO(255, 255, 255, 0.7254901960784313),
      onSurface: Colors.black,
    ),
    dialogTheme: const DialogTheme().copyWith(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(16)),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        textStyle: const TextStyle(fontWeight: FontWeight.bold),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        textStyle: const TextStyle(fontWeight: FontWeight.bold),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        textStyle: const TextStyle(fontWeight: FontWeight.bold),
      ),
    ),
    inputDecorationTheme: const InputDecorationTheme().copyWith(
      filled: true,
      fillColor: const Color.fromRGBO(255, 255, 255, 0.75),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(
          color: primaryColor,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(
          color: primaryColor,
        ),
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(
          color: primaryColor,
        ),
      ),
    ),
    pageTransitionsTheme: const PageTransitionsTheme(
      builders: {
        TargetPlatform.android: FadeThroughPageTransitionsBuilder(),
        TargetPlatform.iOS: FadeThroughPageTransitionsBuilder(),
      },
    ),
  );
}
