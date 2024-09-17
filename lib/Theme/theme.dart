import 'package:flutter/material.dart';
import 'components/bottom_modal_sheet.dart';
import 'components/text_theme.dart';
import 'components/color_scheme.dart';
import 'components/buttons.dart';
import 'components/app_bar_theme.dart';
import 'components/dialog_theme.dart';

class GlobalThemeData {
  // static function to return theme of app using color scheme, focus color
  // and text Theme
  GlobalThemeData._();

  static ThemeData themeData({
    required ColorScheme colorScheme,
    required Color focusColor,
    required TextTheme textTheme,
    required ElevatedButtonThemeData primaryBtn,
    required OutlinedButtonThemeData secondaryBtn,
    required TextButtonThemeData tertiaryBtn,
    required BottomSheetThemeData bottomSheetTheme,
    required AppBarTheme appBarTheme,
    required DialogTheme dialogTheme,
  }) {
    return ThemeData(
      useMaterial3: true,
      colorScheme: colorScheme,
      canvasColor: colorScheme.surface,
      scaffoldBackgroundColor: colorScheme.surface,
      highlightColor: Colors.transparent,
      focusColor: focusColor,
      textTheme: textTheme,
      elevatedButtonTheme: primaryBtn,
      outlinedButtonTheme: secondaryBtn,
      textButtonTheme: tertiaryBtn,
      bottomSheetTheme: bottomSheetTheme,
      appBarTheme: appBarTheme,
      dialogTheme: dialogTheme,
    );
  }

  // light and dark theme data
  static ThemeData lightThemeData = themeData(
    colorScheme: MyColorScheme.lightColorScheme,
    focusColor: MyColorScheme.lightFocusColor,
    textTheme: MyTextTheme.textTheme,
    primaryBtn: MyButtons.lightPrimaryBtn,
    secondaryBtn: MyButtons.lightSecondaryBtn,
    tertiaryBtn: MyButtons.lightTertiaryBtn,
    bottomSheetTheme: BottomSheetTheme.lightBottomSheetTheme,
    appBarTheme: MyAppBarTheme.lightAppBarTheme,
    dialogTheme: MyDialogTheme.appDialogThemeLight,
  );
  static ThemeData darkThemeData = themeData(
    colorScheme: MyColorScheme.darkColorScheme,
    focusColor: MyColorScheme.darkFocusColor,
    textTheme: MyTextTheme.textTheme,
    primaryBtn: MyButtons.darkPrimaryBtn,
    secondaryBtn: MyButtons.darkSecondaryBtn,
    tertiaryBtn: MyButtons.darkTertiaryBtn,
    bottomSheetTheme: BottomSheetTheme.darkBottomSheetTheme,
    appBarTheme: MyAppBarTheme.darkAppBarTheme,
    dialogTheme: MyDialogTheme.appDialogThemeDark,
  );
}
