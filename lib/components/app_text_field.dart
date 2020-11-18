import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {
  AppTextField(
      {@required this.onChange,
      this.hintText = "",
      this.keyboardType = TextInputType.text,
      this.maxLines = 1,
      this.maxLength});

  final Function onChange;
  final String hintText;
  final TextInputType keyboardType;
  final int maxLines;
  final int maxLength;

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChange,
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
