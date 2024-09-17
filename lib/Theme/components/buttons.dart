import 'package:flutter/material.dart';
import 'color_scheme.dart';

class MyButtons {
  MyButtons._();

  // buttons shape
  static const OutlinedBorder _shape = RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(10)),
  );

  // buttons padding
  static const EdgeInsets _padding = EdgeInsets.all(16);

  // Outlined Button border color, style, width
  static final BorderSide _side = BorderSide(
    color: MyColorScheme.darkColorScheme.primary,
    width: 1,
    style: BorderStyle.solid,
  );

  // buttons theme

  // Light Elevated Button
  static final ElevatedButtonThemeData lightPrimaryBtn =
      ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: MyColorScheme.lightColorScheme.primary,
      foregroundColor: MyColorScheme.lightColorScheme.onPrimary,
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      elevation: 0,
      shape: _shape,
      side: _side,
    ),
  );

  // Dark Elevated Button
  static final ElevatedButtonThemeData darkPrimaryBtn = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: MyColorScheme.darkColorScheme.primary,
      foregroundColor: MyColorScheme.darkColorScheme.onPrimary,
      padding: _padding,
      elevation: 0,
      shape: _shape,
      side: _side,
    ),
  );

  // Light outlined Button
  static final OutlinedButtonThemeData lightSecondaryBtn =
      OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      foregroundColor: MyColorScheme.lightColorScheme.primary,
      backgroundColor: Colors.transparent,
      padding: _padding,
      elevation: 0,
      shape: _shape,
      side: _side,
    ),
  );

  // dark outlined button
  static final OutlinedButtonThemeData darkSecondaryBtn =
      OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      foregroundColor: MyColorScheme.darkColorScheme.primary,
      backgroundColor: Colors.transparent,
      padding: _padding,
      elevation: 0,
      shape: _shape,
      side: _side,
    ),
  );

  // light tertiary button
  static final TextButtonThemeData lightTertiaryBtn = TextButtonThemeData(
    style: TextButton.styleFrom(
      backgroundColor: Colors.transparent,
      foregroundColor: MyColorScheme.lightColorScheme.primary,
      padding: _padding,
      elevation: 0,
      shape: _shape,
    ),
  );

  // dark tertiary button
  static final TextButtonThemeData darkTertiaryBtn = TextButtonThemeData(
    style: TextButton.styleFrom(
      backgroundColor: Colors.transparent,
      foregroundColor: MyColorScheme.darkColorScheme.primary,
      padding: _padding,
      elevation: 0,
      shape: _shape,
    ),
  );
}
