import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'theme_text.dart';

class AppThemes {
  AppThemes._();

  static ThemeData lightTheme = ThemeData(
    primaryColor: Colors.white,
    scaffoldBackgroundColor: Colors.white,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    appBarTheme: const AppBarTheme(
      elevation: 0,
      backgroundColor: Colors.white,
      systemOverlayStyle: SystemUiOverlayStyle.light,
    ),
    textTheme: ThemeText.getLightTextTheme(),
  );

}
