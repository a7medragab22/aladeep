import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    fontFamily: 'Poppins',
    scaffoldBackgroundColor: Colors.white,

    textTheme: const TextTheme(
      bodyMedium: TextStyle(fontSize: 14),
      titleLarge: TextStyle(fontWeight: FontWeight.bold),
    ),
  );
}