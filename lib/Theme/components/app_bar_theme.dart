import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyAppBarTheme {
  static const darkAppBarTheme = AppBarTheme(
    scrolledUnderElevation: 0.0,
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
    ),
  );

  static const lightAppBarTheme = AppBarTheme(
    scrolledUnderElevation: 0.0,
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ),
  );
}
