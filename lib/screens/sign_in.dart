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
                                'No more passwords.',
                                style: Theme.of(context)
                                    .textTheme
                                    .headline6
                                    .copyWith(color: kOnSurfaceLightColor),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(vertical: 15),
                                child: TextField(
                                  onChanged: (value) => {},
                                  autofocus: false,
                                  autocorrect: false,
                                  keyboardType: TextInputType.emailAddress,
                                  style: Theme.of(context).textTheme.headline6,
                                  decoration: InputDecoration(
                                    hintText: '@person',
                                    focusColor: Colors.white,
                                    filled: true,
                                    fillColor: Colors.white,
                                  ),
                                ),
                              ),
                              Center(
                                child: RaisedButton(
                                  color: kAccentColor,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30),
                                      side: BorderSide(
                                        color: Colors.transparent,
                                        width: 2,
                                      )),
                                  onPressed: logIn,
                                  child: Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: Text('JOIN US'),
                                  ),
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
