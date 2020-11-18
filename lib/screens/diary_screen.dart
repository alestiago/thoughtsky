import 'package:at_challenge/constants/colors.dart';
import 'package:at_challenge/screens/submit_screen.dart';
import 'package:flutter/material.dart';

class DiaryScreen extends StatelessWidget {
  static final id = "/diary_screen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => {
          Navigator.of(context).push(MaterialPageRoute<void>(
              builder: (BuildContext context) => SubmitScreen()))
        },
        backgroundColor: kAccentColor,
        elevation: 12,
        child: Icon(
          Icons.brush,
          size: 35.0,
          color: kOnAccentColor,
        ),
      ),
      body: Container(
        child: Text('Hello'),
      ),
    );
  }
}
