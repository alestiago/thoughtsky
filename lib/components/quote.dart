import 'package:flutter/material.dart';

class Quote extends StatelessWidget {
  Quote(this.text, {this.color = Colors.brown});

  final Text text;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 20.0),
      decoration: BoxDecoration(
        border: Border(left: BorderSide(color: color, width: 3)),
      ),
      child: text,
    );
  }
}
