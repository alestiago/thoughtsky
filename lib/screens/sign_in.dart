import 'package:at_challenge/components/AppRaisedButton.dart';
import 'package:at_challenge/components/app_text_field.dart';
import 'package:at_challenge/constants/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'home_screen.dart';

class SignIn extends StatefulWidget {
  static final id = "/";

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final String machangoAssetName = 'assets/img/machango.svg';
  final String cloudsAssetName = 'assets/img/clouds.svg';

  @override
  Widget build(BuildContext context) {
    void logIn() {
      print("Pressed");
      Navigator.pushNamedAndRemoveUntil(
          context, HomeScreen.id, (route) => false);
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: kBackgroundColor,
      body: SafeArea(
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
                          'Thoughtsky.',
                          style: Theme.of(context).textTheme.headline4.copyWith(
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
                                  hintText: "@person",
                                  keyboardType: TextInputType.text,
                                ),
                              ),
                              Center(
                                child: AppRaisedButton(
                                  title: 'LOG IN',
                                  backgroundColor: kAccentColor,
                                  onPressed: logIn,
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
    );
  }
}
