import 'package:at_challenge/components/thought_card.dart';
import 'package:at_challenge/constants/colors.dart';
import 'package:at_challenge/screens/submit_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CloudScreen extends StatelessWidget {
  static final id = "/cloud_screen";

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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              ThoughtCard(),
              ThoughtCard(),
            ],
          ),
        ),
      ),
    );
  }
}
