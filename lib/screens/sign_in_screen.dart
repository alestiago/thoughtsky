import 'package:at_challenge/components/app_raised_button.dart';
import 'package:at_challenge/components/app_text_field.dart';
import 'package:at_challenge/constants/colors.dart';
import 'package:at_challenge/services/database_service.dart';
import 'package:at_challenge/services/server_demo_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:at_demo_data/at_demo_data.dart' as at_demo_data;
import 'package:modal_progress_hud/modal_progress_hud.dart';

import 'home_screen.dart';

class SignIn extends StatefulWidget {
  static final id = "/sign_in";

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final String machangoAssetName = 'assets/img/machango.svg';
  final String cloudsAssetName = 'assets/img/clouds.svg';

  bool showSpinner = false;
  ServerDemoService _serverDemoService = ServerDemoService.getInstance();
  String atSign = "";

  @override
  Widget build(BuildContext context) {
    DatabaseService databaseService = context.watch<DatabaseService>();

    // Events
    void onInputChange(value) {
      setState(() {
        atSign = value;
      });
    }

    /// Use onboard() if device has PKAM public/private keys
    /// in keychain. If that is unsuccessful, use authenticate()
    /// to perform a CRAM auth instead.
    _login(atSign) async {
      // Removes focus from text field.
      FocusScopeNode currentFocus = FocusScope.of(context);
      if (!currentFocus.hasPrimaryFocus) {
        currentFocus.unfocus();
      }

      setState(() {
        showSpinner = true;
      });

      if (atSign != null) {
        print('Trying to log in as $atSign');
        _serverDemoService.onboard().then((value) {
          print('Successfully logged in at $atSign');
          databaseService.logIn(atSign);
          Navigator.pushNamedAndRemoveUntil(
              context, HomeScreen.id, (route) => false);
        }).catchError((error) async {
          print(
              "Failed to log in as $atSign with PKAM attempting with CRAM key.");
          print("Cram key found: ${at_demo_data.cramKeyMap[atSign]}");

          // This might throw a lot of verbose errors.
          // This issue was discussed with @Tyler McNierny and @Tyler Trott.
          // Try uninstalling the application and installing it back, and using
          // another valid test @sign.
          // If still authentication issues are present. Change code to navigate
          // to HomeScreen to test the application.
          await _serverDemoService.authenticate(atSign,
              cramSecret: at_demo_data.cramKeyMap[atSign]);
          databaseService.logIn(atSign);
          Navigator.pushNamedAndRemoveUntil(
              context, HomeScreen.id, (route) => false);
        });

        print(
            "Failed to authenticate with cramKey for $atSign (${at_demo_data.cramKeyMap[atSign]})");
      }

      setState(() {
        showSpinner = false;
      });
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: kBackgroundColor,
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        color: kSurfaceLightColor,
        child: SafeArea(
          child: Stack(
            alignment: AlignmentDirectional.topEnd,
            children: [
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          top: 60.0, left: 20, bottom: 20, right: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            'Thoughtsky',
                            style: Theme.of(context)
                                .textTheme
                                .headline4
                                .copyWith(
                                    color: kOnBackgroundColor.withOpacity(0.5)),
                          ),
                          Text(
                            'Sign in.',
                            style: Theme.of(context).textTheme.headline1,
                          ),
                        ],
                      ),
                    ),
                    SvgPicture.asset(cloudsAssetName),
                    Expanded(
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: kSurfaceLightColor,
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(20.0),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  "We support @ protocol",
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline5
                                      .copyWith(color: kOnSurfaceLightColor),
                                ),
                                Text(
                                  'No need for passwords.',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline6
                                      .copyWith(color: kOnSurfaceLightColor),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(vertical: 15),
                                  child: AppTextField(
                                    onChange: onInputChange,
                                    hintText: "@person",
                                    keyboardType: TextInputType.emailAddress,
                                  ),
                                ),
                                Center(
                                  child: AppRaisedButton(
                                    title: 'Log in',
                                    backgroundColor: kAccentColor,
                                    onPressed: () async => _login(atSign),
                                  ),
                                )
                              ]),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 80.0, right: 30.0),
                child: SvgPicture.asset(machangoAssetName),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
