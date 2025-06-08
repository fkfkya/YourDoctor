import 'package:flutter/material.dart';

/// Общая тема приложения: светлая и тёмная
class AppTheme {
  /// Светлая тема
  static final ThemeData light = ThemeData(
    brightness: Brightness.light,
    primarySwatch: Colors.blue,
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.blue,
      foregroundColor: Colors.white,
    ),
    colorScheme: ColorScheme.fromSwatch(
      primarySwatch: Colors.blue,
    ).copyWith(
      secondary: Colors.blueAccent,
      brightness: Brightness.light,
    ),
    textTheme: Typography.blackMountainView,
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );

  /// Тёмная тема
  static final ThemeData dark = ThemeData(
    brightness: Brightness.dark,
    primarySwatch: Colors.blue,
    scaffoldBackgroundColor: Colors.black,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.black,
      foregroundColor: Colors.white,
    ),
    colorScheme: ColorScheme.fromSwatch(
      primarySwatch: Colors.blue,
      brightness: Brightness.dark,
    ).copyWith(
      secondary: Colors.blueAccent,
      brightness: Brightness.dark,
    ),
    textTheme: Typography.whiteMountainView,
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );
}