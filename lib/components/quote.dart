import 'package:at_challenge/constants/colors.dart';
import 'package:flutter/material.dart';

class Quote extends StatelessWidget {
  Quote(this.text, {this.color = kSurfaceColor});

  final Text text;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 10.0),
      decoration: BoxDecoration(
        border: Border(left: BorderSide(color: color, width: 3)),
      ),
      child: text,
    );
  }
}
