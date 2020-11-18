import 'package:at_challenge/constants/colors.dart';
import 'package:at_challenge/theme/app_text_theme.dart';
import 'package:flutter/material.dart';

class AppRaisedButton extends StatelessWidget {
  AppRaisedButton(
      {@required this.onPressed,
      this.title = "BUTTON",
      this.backgroundColor = kSurfaceColor,
      this.foregroundColor = kOnSurfaceColor});

  final String title;
  final Function onPressed;
  final Color backgroundColor;
  final Color foregroundColor;

  final TextTheme textTheme = AppTextTheme.textTheme;

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      color: backgroundColor,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
          side: BorderSide(
            color: Colors.transparent,
            width: 2,
          )),
      onPressed: onPressed,
      child: Padding(
        padding: EdgeInsets.all(12.0),
        child: Text(
          title,
          style: textTheme.button.copyWith(color: foregroundColor),
        ),
      ),
    );
  }
}
