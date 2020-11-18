import 'package:at_challenge/components/AppRaisedButton.dart';
import 'package:at_challenge/components/app_text_field.dart';
import 'package:at_challenge/constants/colors.dart';
import 'package:at_challenge/models/thought.dart';
import 'package:at_challenge/theme/app_text_theme.dart';
import 'package:flutter/material.dart';

class SubmitScreen extends StatefulWidget {
  static const id = "/submit_screen";

  @override
  _SubmitScreenState createState() => _SubmitScreenState();
}

class _SubmitScreenState extends State<SubmitScreen> {
  final String sadMoodAssetName = 'assets/img/mood_sad.svg';
  final String neutralMoodAssetName = 'assets/img/mood_neutral.svg';
  final String happyMoodAssetName = 'assets/img/mood_happy.svg';
  final maxLines = 24;

  @override
  Widget build(BuildContext context) {
    final textTheme = AppTextTheme.textTheme; // TODO: use Theme.of(context)

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: kAccentColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Tuesday 17 November',
                  style:
                      textTheme.headline5.copyWith(color: kOnSurfaceLightColor),
                ),
                Text(
                  "What's on your\n mind?",
                  style:
                      textTheme.headline3.copyWith(color: kOnSurfaceLightColor),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: 30.0, left: 80.0, bottom: 10.0, right: 80.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _MoodButton(
                        mood: Mood.sad,
                        onPressed: () => {},
                      ),
                      Thought.getMoodPicture(Mood.neutral),
                      Thought.getMoodPicture(Mood.happy),
                    ],
                  ),
                ),
                AppTextField(
                  hintText: "Title",
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: AppTextField(
                    hintText: "Today I feel...",
                    maxLines: 4,
                    maxLength: 140,
                  ),
                ),
                Center(
                  child: AppRaisedButton(
                    title: "SAVE",
                    onPressed: () => {},
                  ),
                ),
//                Row(
//                  children: [
//                    AppTextField(hintText: "@name"),
//                    AppRaisedButton(
//                      onPressed: () => {},
//                    )
//                  ],
//                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _MoodButton extends StatefulWidget {
  _MoodButton({@required this.mood, @required this.onPressed});

  final Mood mood;
  final Function onPressed;

  @override
  __MoodButtonState createState() => __MoodButtonState();
}

class __MoodButtonState extends State<_MoodButton> {
  bool value = true;

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: value ? 1 : 0.6,
      child: Thought.getMoodPicture(widget.mood),
    );
  }
}
