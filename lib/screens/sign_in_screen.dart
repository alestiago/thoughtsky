import 'package:at_challenge/components/app_raised_button.dart';
import 'package:at_challenge/components/app_text_field.dart';
import 'package:at_challenge/constants/colors.dart';
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

  bool checkLogInCredential() {
    if (atSign.isEmpty) return false;

    // Attempt login
    return true;
  }

  /// Use onboard() if device has PKAM public/private keys
  /// in keychain. If that is unsuccessful, use authenticate()
  /// to perform a CRAM auth instead.
  _login(atSign) async {
    FocusScope.of(context).unfocus();
    setState(() {
      showSpinner = true;
    });

    // Check the input before attempting to log in
    if (!checkLogInCredential()) {
      setState(() {
        showSpinner = false;
      });
      return;
    }

    print('Trying to log in as $atSign');
    if (atSign != null) {
      _serverDemoService.onboard().then((value) {
        print('Successfully logged in at $atSign');
        Navigator.pushNamedAndRemoveUntil(
            context, HomeScreen.id, (route) => false);
      }).catchError((error) async {
        print("This is the key:");
        print(at_demo_data.cramKeyMap[atSign]);
        print('Failed to log in as $atSign');

        setState(() {
          showSpinner = false;
        });

        await _serverDemoService.authenticate(atSign,
            cramSecret: at_demo_data.cramKeyMap[atSign]);
        Navigator.pushNamedAndRemoveUntil(
            context, HomeScreen.id, (route) => false);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // Events
    void onInputChange(value) {
      setState(() {
        atSign = value;
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
                                    onPressed: () => _login(atSign),
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
