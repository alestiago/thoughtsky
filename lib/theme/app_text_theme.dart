import 'package:at_challenge/constants/colors.dart';
import 'package:flutter/material.dart';

class AppTextTheme {
  static final String primaryFont = 'Merriweather';
  static final String secondaryFont = 'MerriweatherSans';

  static final TextTheme textTheme = TextTheme(
    headline1: TextStyle(
      fontFamily: 'Merriweather',
      fontSize: 72,
      letterSpacing: -3,
      fontWeight: FontWeight.bold,
    ),
    headline2: TextStyle(
      fontFamily: 'Merriweather',
      fontSize: 40,
      letterSpacing: -3,
      fontWeight: FontWeight.bold,
    ),
    headline3: TextStyle(
      fontFamily: 'Merriweather',
      fontSize: 30,
      letterSpacing: -3,
      fontWeight: FontWeight.bold,
    ),
    headline4: TextStyle(
      fontFamily: 'Merriweather',
      fontSize: 24,
      letterSpacing: -0.6,
      fontWeight: FontWeight.bold,
    ),
    headline5: TextStyle(
      fontFamily: 'Merriweather',
      fontSize: 16,
      letterSpacing: 0.15,
      fontWeight: FontWeight.bold,
    ),
    headline6: TextStyle(
      color: kOnSurfaceColor,
      fontFamily: 'Merriweather',
      letterSpacing: 0.15,
      fontSize: 14.0,
    ),
    subtitle1: TextStyle(
      fontFamily: 'Merriweather',
      fontSize: 14,
      letterSpacing: -1,
    ),
    subtitle2: TextStyle(
      fontFamily: 'MerriweatherSans',
      fontSize: 13,
    ),
    button: TextStyle(
      fontFamily: 'Merriweather',
      fontSize: 12,
      letterSpacing: 1.25,
      fontWeight: FontWeight.bold,
    ),
  );
}
