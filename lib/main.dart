import 'package:at_challenge/screens/cloud_screen.dart';
import 'package:at_challenge/screens/diary_screen.dart';
import 'package:at_challenge/screens/friends_screen.dart';
import 'package:at_challenge/screens/home_screen.dart';
import 'package:at_challenge/screens/sign_in.dart';
import 'package:at_challenge/screens/submit_screen.dart';
import 'package:at_challenge/theme/app_text_theme.dart';
import 'package:flutter/material.dart';

import 'constants/colors.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      routes: {
        SignIn.id: (context) => SignIn(),
        HomeScreen.id: (context) => HomeScreen(),
        SubmitScreen.id: (context) => SubmitScreen(),
//        CloudScreen.id: (context) => CloudScreen(),
//        DiaryScreen.id: (context) => DiaryScreen(),
//        FriendsScreen.id: (context) => FriendsScreen(),
      },
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        textTheme: AppTextTheme.textTheme,
        pageTransitionsTheme: const PageTransitionsTheme(
          builders: <TargetPlatform, PageTransitionsBuilder>{
            TargetPlatform.android: ZoomPageTransitionsBuilder(),
          },
        ),
      ),
    );
  }
}
