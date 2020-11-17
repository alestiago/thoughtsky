import 'package:at_challenge/constants/colors.dart';
import 'package:flutter/material.dart';

class AppTextTheme {
  static final String primaryFont = 'Merriweather';
  static final String secondaryFont = 'MerriweatherSans';

  static final TextTheme textTheme = TextTheme(
    headline1: TextStyle(
      color: kOnBackgroundColor,
      fontFamily: 'Merriweather',
      fontSize: 90,
      fontWeight: FontWeight.bold,
    ),
    headline2: TextStyle(
      color: Colors.white.withOpacity(0.8),
      fontFamily: 'Merriweather',
      fontSize: 35,
      fontWeight: FontWeight.bold,
    ),
    headline6: TextStyle(
      color: kOnSurfaceColor,
      fontFamily: 'Merriweather',
      fontSize: 22.0,
      fontWeight: FontWeight.bold,
    ),
  );
}
