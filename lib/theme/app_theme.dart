import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppTheme {
  static ThemeData get lightTheme => ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigoAccent),
        extensions: const [AppColors.light],
        appBarTheme: const AppBarTheme(
          backgroundColor: null, // Uses colorScheme.inversePrimary by default
        ),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: Colors.indigoAccent,
          foregroundColor: Colors.white,
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.indigoAccent,
          unselectedItemColor: Colors.grey,
        ),
      );
}
