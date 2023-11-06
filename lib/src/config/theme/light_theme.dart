import 'package:foodivoire/src/shared/constant/colors.dart';
import 'package:flutter/material.dart';

class LightTheme {
  static themeData() {
    return ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: green),
      useMaterial3: true,
      appBarTheme: const AppBarTheme(
        color: white,
      ),
      scaffoldBackgroundColor: white,
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          textStyle: MaterialStateProperty.all(
            const TextStyle(
              fontFamily: 'Inter',
              fontSize: 15,
              fontWeight: FontWeight.w700,
            ),
          ),
          shape: MaterialStateProperty.all(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))),
          backgroundColor: MaterialStateProperty.all(green),
          foregroundColor: MaterialStateProperty.all(white),
        ),
      ),
      textTheme: const TextTheme(
        headlineLarge: TextStyle(
          color: black,
          fontFamily: 'Inter',
          fontWeight: FontWeight.w700,
          fontSize: 28,
        ),
        headlineMedium: TextStyle(
          fontSize: 24,
          color: black,
          fontWeight: FontWeight.w700,
        ),
        headlineSmall:
            TextStyle(color: black, fontFamily: 'Inter', fontSize: 14),
        bodyLarge: TextStyle(
          fontFamily: 'Inter',
          fontSize: 22,
          fontWeight: FontWeight.w500,
        ),
        bodyMedium: TextStyle(
          fontFamily: 'Inter',
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
        bodySmall: TextStyle(
          fontFamily: 'Inter',
          fontSize: 12,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
