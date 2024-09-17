import 'package:flutter/material.dart';
import 'color_scheme.dart';

class MyDialogTheme {
  static final appDialogThemeLight = DialogTheme(
    backgroundColor: MyColorScheme.lightColorScheme.secondary,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(10)),
    ),
  );

  static final appDialogThemeDark = DialogTheme(
    backgroundColor: MyColorScheme.darkColorScheme.secondary,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(10)),
    ),
  );
}
