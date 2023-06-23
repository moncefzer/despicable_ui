import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'theme_text.dart';

class AppThemes {
  AppThemes._();

  static ThemeData lightTheme = ThemeData(
    // unselectedWidgetColor: AppColors.royalBlue,
    primaryColor: Colors.white,
    scaffoldBackgroundColor: Colors.white,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    appBarTheme: const AppBarTheme(
      elevation: 0,
      backgroundColor: Colors.white,
      systemOverlayStyle: SystemUiOverlayStyle.light,
    ),
    // cardTheme: const CardTheme(color: AppColors.vulcan),
    textTheme: ThemeText.getLightTextTheme(),
    // brightness: Brightness.dark,
    // colorScheme:
    //     ColorScheme.fromSwatch().copyWith(secondary: AppColors.royalBlue),
  );

  // static ThemeData darkTheme(BuildContext context) => ThemeData(
  //   unselectedWidgetColor: AppColors.royalBlue,
  //   primaryColor: AppColors.vulcan,
  //   scaffoldBackgroundColor: AppColors.vulcan,
  //   visualDensity: VisualDensity.adaptivePlatformDensity,
  //   appBarTheme: const AppBarTheme(
  //     elevation: 0,
  //     backgroundColor: AppColors.vulcan,
  //     systemOverlayStyle: SystemUiOverlayStyle.light,
  //   ),
  //   textTheme: ThemeText.getDarkTextTheme(),
  //   cardTheme: const CardTheme(color: Colors.white),
  // brightness: Brightness.light,
  //   colorScheme:
  //       ColorScheme.fromSwatch().copyWith(secondary: AppColors.royalBlue),
  // );
}
