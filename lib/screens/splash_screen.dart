import 'dart:async';

import 'package:at_challenge/constants/colors.dart';
import 'package:at_challenge/screens/sign_in_screen.dart';
import 'package:at_challenge/theme/app_text_theme.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  static const id = "/";

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final textTheme = AppTextTheme.textTheme;

  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 3),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => SignIn())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Thoughtsky',
              style: textTheme.headline4.copyWith(color: kSurfaceColor),
            ),
            Text('Clear minds.',
                style:
                    textTheme.subtitle1.copyWith(color: kOnSurfaceLightColor))
          ],
        ),
      ),
    );
  }
}
