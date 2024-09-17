import 'package:flutter/material.dart';

class MyColorScheme {
  MyColorScheme._();

  // light color scheme for app
  static const ColorScheme lightColorScheme = ColorScheme(
    brightness: Brightness.light,
    primary: Color(0xFF00ABB3),
    onPrimary: Color(0xFFFFFFFF),
    secondary: Color(0xFF353535),
    onSecondary: Color(0xFF000000),
    tertiary: Color(0xFFB4B4B4),
    error: Colors.redAccent,
    onError: Color(0xFFFFFFFF),
    surface: Color(0xFFEAEAEA),
    onSurface: Color(0xFF000000),
  );

  // dark color scheme for app
  static const ColorScheme darkColorScheme = ColorScheme(
    brightness: Brightness.dark,
    primary: Color(0xFF00ABB3),
    onPrimary: Color(0xFF000000),
    secondary: Color(0xFF353535),
    onSecondary: Color(0xFF000000),
    tertiary: Color.fromARGB(255, 118, 118, 118),
    error: Colors.redAccent,
    onError: Colors.white,
    surface: Color(0xFF000000),
    onSurface: Color(0xFFFFFFFF),
  );

  // focus colors
  static final Color lightFocusColor = Colors.black.withOpacity(0.12);
  static final Color darkFocusColor = Colors.white.withOpacity(0.12);
}
