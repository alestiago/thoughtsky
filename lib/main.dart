///
/// This is a conceptual Flutter Application to exemplify use of the
/// @Protocol developed by the @ Company.
///
/// It was build in less than three days from scratch as part of the
/// Flutter Vikings 2020 activity by the @ Company.
///
/// Therefore, the real functionality might be limited and the code might have
/// some errors. Like for example, resizability, user error checking.
///
/// If you would like to try it we recommend using Nexus 6P API 25 emulator.
/// and follow the setup provided by the @ protocol. Which you can find here:
/// - https://docs.google.com/document/d/1s1V3kZot4vWsn2f9B3Sy0P5OesCQXigypxFCNpqoBKs/edit
///

import 'package:at_challenge/providers/user_data.dart';
import 'package:at_challenge/screens/home_screen.dart';
import 'package:at_challenge/screens/sign_in_screen.dart';
import 'package:at_challenge/screens/splash_screen.dart';
import 'package:at_challenge/screens/submit_screen.dart';
import 'package:at_challenge/services/database_service.dart';
import 'package:at_challenge/theme/app_text_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());

  // Disables horizontal orientation.
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]).then((_) {
    runApp(MyApp());
  });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<DatabaseService>(
          create: (_) => DatabaseService(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Thoughtsky',
        routes: {
          SplashScreen.id: (context) => SplashScreen(),
          SignIn.id: (context) => SignIn(),
          HomeScreen.id: (context) => HomeScreen(),
          SubmitScreen.id: (context) => SubmitScreen(),
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
      ),
    );
  }
}
