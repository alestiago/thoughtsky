import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {
  AppTextField(
      {@required this.onChange,
      this.hintText = "",
      this.keyboardType = TextInputType.text,
      this.maxLines = 1,
      this.maxLength,
      this.textStyle,
      this.controller});

  final Function onChange;
  final String hintText;
  final TextInputType keyboardType;
  final int maxLines;
  final int maxLength;
  final TextStyle textStyle;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller ?? null,
      onChanged: onChange,
      autofocus: false,
      autocorrect: false,
      keyboardType: keyboardType,
      style: textStyle ?? Theme.of(context).textTheme.headline6,
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
