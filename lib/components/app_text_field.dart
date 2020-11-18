import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {
  AppTextField(
      {this.hintText = "",
      this.keyboardType = TextInputType.text,
      this.maxLines = 1,
      this.maxLength});

  final String hintText;
  final TextInputType keyboardType;
  final int maxLines;
  final int maxLength;

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (value) => {},
      autofocus: false,
      autocorrect: false,
      keyboardType: keyboardType,
      style: Theme.of(context).textTheme.headline6,
      maxLines: maxLines,
      maxLength: maxLength,
      decoration: InputDecoration(
        hintText: hintText,
        focusColor: Colors.white,
        filled: true,
        fillColor: Colors.white,
      ),
    );
  }
}
