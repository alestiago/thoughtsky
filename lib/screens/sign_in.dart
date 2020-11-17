import 'package:at_challenge/constants/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'home_screen.dart';

class SignIn extends StatefulWidget {
  static final id = "/";

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Sign in.',
            style: Theme.of(context).textTheme.headline1,
          ),
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  color: kSurfaceColor,
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(20))),
              child: Padding(
                padding: EdgeInsets.all(20.0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "We support @ protocol",
                        style: Theme.of(context).textTheme.headline6,
                      ),
                      Text(
                        'No more passwords.',
                        style: TextStyle(
                          fontFamily: 'MerriweatherSans',
                          fontSize: 16,
                          color: kOnSurfaceColor,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 30),
                        child: TextField(
                          onChanged: (value) => {},
                          autofocus: false,
                          autocorrect: false,
                          style: Theme.of(context).textTheme.headline6,
                          decoration: InputDecoration(
                            hintText: '@person',
                            focusColor: Colors.white,
                            filled: true,
                            fillColor: Colors.grey,
                            hoverColor: Colors.white,
                          ),
                        ),
                      ),
                      RaisedButton(
                        color: kAccentColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                            side: BorderSide(
                              color: Colors.transparent,
                              width: 2,
                            )),
                        onPressed: logIn,
                        child: Text('JOIN'),
                      )
                    ]),
              ),
            ),
          )
        ],
      ),
    );
  }
}
