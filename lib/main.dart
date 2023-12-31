import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'pages/home_page.dart';
import 'theme/app_themes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          title: 'Starter app',
          debugShowCheckedModeBanner: false,
          theme: AppThemes.lightTheme,
          themeMode: ThemeMode.light,
          home: const HomePage(),
        );
      },
    );
  }
}
