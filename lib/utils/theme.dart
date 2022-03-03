import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import './colors.dart';

final ThemeData kShrineTheme = _buildShrineTheme();

TextTheme buildShrineTextTheme(TextTheme base) {
  return base
      .copyWith(
        headline5: base.headline5!.copyWith(
          fontWeight: FontWeight.w500,
        ),
        headline6: base.headline6!.copyWith(
          fontSize: 18.0.sp,
        ),
        caption: base.caption!.copyWith(
          fontWeight: FontWeight.w400,
          fontSize: 14.0.sp,
        ),
        bodyText1: base.bodyText1!.copyWith(
          fontWeight: FontWeight.w500,
          fontSize: 16.0.sp,
        ),
      )
      .apply(
        fontFamily: GoogleFonts.rubik().fontFamily ?? 'Rubik',
        displayColor: kShrineBrown900,
        bodyColor: kShrineBrown900,
      );
}

ThemeData _buildShrineTheme() {
  final ThemeData base = ThemeData.light();
  return base.copyWith(
    textTheme: buildShrineTextTheme(base.textTheme),
    textSelectionTheme: const TextSelectionThemeData(
      selectionColor: kShrinePink100,
    ),
    colorScheme: base.colorScheme.copyWith(
      primary: kShrinePink100,
      onPrimary: kShrineBrown900,
      secondary: kShrineBrown900,
      error: kShrineErrorRed,
    ),
  );
}
