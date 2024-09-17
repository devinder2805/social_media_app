import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyTextTheme {
  MyTextTheme._();

  // text Theme
  static final TextTheme textTheme = TextTheme(
    bodySmall: GoogleFonts.ubuntu(
      fontSize: 12,
      fontWeight: FontWeight.w300,
      color: Colors.grey,
    ),
    bodyMedium: GoogleFonts.ubuntu(
      fontSize: 14,
      fontWeight: FontWeight.w300,
    ),
    bodyLarge: GoogleFonts.ubuntu(
      fontSize: 30,
      fontWeight: FontWeight.w300,
    ),
    headlineSmall: GoogleFonts.ubuntu(
      fontSize: 16,
      fontWeight: FontWeight.bold,
    ),
    headlineMedium: GoogleFonts.ubuntu(
      fontSize: 24,
      fontWeight: FontWeight.bold,
    ),
    headlineLarge: GoogleFonts.ubuntu(
      fontSize: 32,
      fontWeight: FontWeight.bold,
    ),
  );
}
