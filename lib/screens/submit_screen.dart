import 'package:at_challenge/constants/colors.dart';
import 'package:flutter/material.dart';

class SubmitScreen extends StatefulWidget {
  static const id = "/submit_screen";

  @override
  _SubmitScreenState createState() => _SubmitScreenState();
}

class _SubmitScreenState extends State<SubmitScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kAccentColor,
    );
  }
}
