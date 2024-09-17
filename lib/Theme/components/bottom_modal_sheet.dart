import 'package:flutter/material.dart';
import 'color_scheme.dart';

class BottomSheetTheme {
  BottomSheetTheme._();

  static final BottomSheetThemeData lightBottomSheetTheme =
      BottomSheetThemeData(
    backgroundColor: MyColorScheme.lightColorScheme.secondary,
    modalBackgroundColor: MyColorScheme.lightColorScheme.secondary,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(20),
      ),
    ),
  );

  static final BottomSheetThemeData darkBottomSheetTheme = BottomSheetThemeData(
    backgroundColor: MyColorScheme.darkColorScheme.secondary,
    modalBackgroundColor: MyColorScheme.darkColorScheme.secondary,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(20),
      ),
    ),
  );
}
