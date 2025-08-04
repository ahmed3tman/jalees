import 'package:flutter/material.dart';

class AppTheme {
  static final lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    colorScheme: ColorScheme.light(
      primary: const Color(0xFF4a6b5d), // Soothing green
      secondary: const Color(0xFFd4af37), // Gold accent
      background: const Color(0xFFf5f5f5), // Off-white
      surface: Colors.white,
      onPrimary: Colors.white,
      onSecondary: Colors.black,
      onBackground: Colors.black,
      onSurface: Colors.black,
      error: Colors.red.shade400,
      onError: Colors.white,
    ),
    scaffoldBackgroundColor: const Color(0xFFf5f5f5),
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xFFf5f5f5),
      elevation: 0.5,
      iconTheme: IconThemeData(color: Color(0xFF4a6b5d)),
      titleTextStyle: TextStyle(
        color: Color(0xFF4a6b5d),
        fontSize: 22,
        fontWeight: FontWeight.bold,
        fontFamily: 'UthmanicHafs',
      ),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Colors.white,
      selectedItemColor: Color(0xFF4a6b5d),
      unselectedItemColor: Colors.grey,
      type: BottomNavigationBarType.fixed,
      elevation: 5,
    ),
    cardTheme: CardThemeData(
      color: Colors.white,
      elevation: 1,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: Colors.grey.shade200, width: 1),
      ),
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: Colors.black87, fontSize: 18.0, height: 1.6),
      bodyMedium: TextStyle(color: Colors.black54, fontSize: 16.0, height: 1.5),
      titleLarge: TextStyle(color: Color(0xFF4a6b5d), fontWeight: FontWeight.bold, fontSize: 20.0),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Colors.white,
      hintStyle: TextStyle(color: Colors.grey.shade500),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide.none,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Color(0xFF4a6b5d), width: 1.5),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF4a6b5d),
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      ),
    ),
  );
}