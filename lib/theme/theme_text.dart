import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

class ThemeText {
  const ThemeText._();

  static TextTheme get _appTextTheme => GoogleFonts.workSansTextTheme();

  static TextStyle? get _whiteHeadlineMedium =>
      _appTextTheme.headlineSmall?.copyWith(
        fontWeight: FontWeight.w900,
        fontSize: 34.sp,
        color: Colors.white.withOpacity(0.8),
        letterSpacing: 1.2,
      );

  static TextStyle? get _whiteHeadlineSmall =>
      _appTextTheme.headlineSmall?.copyWith(
        fontSize: 23.sp,
        color: Colors.white,
      );

  static TextStyle? get _whiteTitleLarge => _appTextTheme.titleLarge?.copyWith(
        fontSize: 20.sp,
        color: Colors.white,
      );

  static TextStyle? get _whiteTitleMedium =>
      _appTextTheme.titleMedium?.copyWith(fontSize: 16.sp, color: Colors.white);

  static TextStyle? get _whiteBodyMedium => _appTextTheme.bodyMedium?.copyWith(
        fontSize: 14.sp,
        color: Colors.white,
        wordSpacing: 0.25,
        letterSpacing: 0.25,
      );

  static TextStyle? get _whiteLabelLarge => _appTextTheme.labelLarge?.copyWith(
        fontSize: 14.sp,
        color: Colors.white,
      );

  static getDarkTextTheme() => TextTheme(
        headlineSmall: _whiteHeadlineSmall,
        titleLarge: _whiteTitleLarge,
        titleMedium: _whiteTitleMedium,
        bodyMedium: _whiteBodyMedium,
        labelLarge: _whiteLabelLarge,
      );

  static getLightTextTheme() => TextTheme(
        headlineMedium: _whiteHeadlineMedium?.copyWith(color: Colors.black),
        headlineSmall: _whiteHeadlineSmall?.copyWith(color: Colors.black),
        titleLarge: _whiteTitleLarge?.copyWith(color: Colors.black),
        titleMedium: _whiteTitleMedium?.copyWith(color: Colors.black),
        bodyMedium: _whiteBodyMedium?.copyWith(color: Colors.black),
        labelLarge: _whiteLabelLarge?.copyWith(color: Colors.black),
      );
}

/// | NAME             | SIZE |  WEIGHT |  SPACING |             |
/// |------------------|------|---------|----------|-------------|
/// | displayLarge    | 96.0 | light   | -1.5     |             |
/// | displayMedium   | 60.0 | light   | -0.5     |             |
/// | displaySmall    | 48.0 | regular |  0.0     |             |
/// | headlineMedium  | 34.0 | regular |  0.25    |             |
/// | headlineSmall   | 24.0 | regular |  0.0     |             |
/// | titleLarge      | 20.0 | medium  |  0.15    |             |
/// | titleMedium     | 16.0 | regular |  0.15    |             |
/// | titleSmall      | 14.0 | medium  |  0.1     |             |
/// | bodyLarge       | 16.0 | regular |  0.5     | (bodyText1) |
/// | bodyMedium      | 14.0 | regular |  0.25    | (bodyText2) |
/// | bodySmall       | 14.0 | medium  |  1.25    |             |
/// | labelLarge      | 12.0 | regular |  0.4     |             |
/// | labelSmall      | 10.0 | regular |  1.5     |             |