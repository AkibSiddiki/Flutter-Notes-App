import 'package:flutter/material.dart';

final darkTheme = ThemeData(
  primaryColor: Colors.amber, // Change this to your preferred primary color
  hintColor: Colors.black87,
  scaffoldBackgroundColor: Colors.black,
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.transparent,
  ),

  colorScheme: const ColorScheme.dark(
    primary: Colors.amber, // Surface color
    background: Colors.black,
    onSurface: Colors.white,
  ),

  // Typography
  textTheme: const TextTheme(
    titleLarge: TextStyle(
      fontSize: 20.0,
      fontWeight: FontWeight.bold,
      color: Colors.white70, // Text color
    ),
    bodyMedium: TextStyle(
      fontSize: 16.0,
      color: Colors.white70, // Text color
    ),
  ),

  iconTheme: const IconThemeData(
    color: Colors.white70, // Icon color
    size: 24.0, // Icon size
  ),

  buttonTheme: const ButtonThemeData(
    buttonColor: Colors.amber, // Button background color
    textTheme: ButtonTextTheme.primary,
  ),
);

final lightTheme = ThemeData(
  // Primary and accent colors for dark theme
  primaryColor: Colors.blue, // Change this to your preferred primary color
  hintColor: Colors.green, // Change this to your preferred accent color

  // Define the dark color scheme
  colorScheme: const ColorScheme.dark(
    primary: Colors.blue,
    secondary: Colors.green,
    surface: Colors.black, // Surface color
    background: Colors.white, // Background color
  ),

  // Typography
  textTheme: const TextTheme(
    titleLarge: TextStyle(
      fontSize: 20.0,
      fontWeight: FontWeight.bold,
      color: Colors.black, // Text color
    ),
    bodyMedium: TextStyle(
      fontSize: 16.0,
      color: Colors.black, // Text color
    ),
  ),

  // Define other visual elements like icon styling
  iconTheme: const IconThemeData(
    color: Colors.black, // Icon color
    size: 24.0, // Icon size
  ),

  // Additional theme properties like button theming
  buttonTheme: const ButtonThemeData(
    buttonColor: Colors.blue, // Button background color
    textTheme: ButtonTextTheme.primary,
  ),

  // Other theme properties like card theming, input decoration theming, etc.
);
