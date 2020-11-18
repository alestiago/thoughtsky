import 'package:at_challenge/components/app_raised_button.dart';
import 'package:at_challenge/components/app_text_field.dart';
import 'package:at_challenge/constants/colors.dart';
import 'package:at_challenge/models/thought.dart';
import 'package:at_challenge/theme/app_text_theme.dart';
import 'package:flutter/cupertino.dart';
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

    // Event Handlers
    void onClose() => Navigator.pop(context);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: kAccentColor,
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(8.0),
        child: Row(
          children: [
            Expanded(
                child: AppTextField(
              hintText: "@name",
            )),
            SizedBox(width: 20.0),
            AppRaisedButton(
              title: "Share",
              backgroundColor: kSurfaceLightColor,
              onPressed: () => {},
            )
          ],
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Tuesday 17 November',
                      style: textTheme.headline5
                          .copyWith(color: kOnSurfaceLightColor),
                    ),
                    IconButton(
                      onPressed: onClose,
                      icon: Icon(
                        Icons.close,
                        size: 35.0,
                        color: kOnSurfaceLightColor,
                      ),
                      iconSize: 35.0,
                    ),
                  ],
                ),
                Text(
                  "What's on your\n mind?",
                  style:
                      textTheme.headline3.copyWith(color: kOnSurfaceLightColor),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: 30.0, left: 80.0, bottom: 10.0, right: 80.0),
                  child: _MoodRadioButtons(),
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
                    title: "Save",
                    onPressed: () => {},
                  ),
                ),
                SizedBox(
                  height: 150,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _MoodRadioButtons extends StatefulWidget {
  _MoodRadioButtons();

  @override
  _MoodRadioButtonsState createState() => _MoodRadioButtonsState();
}

class _MoodRadioButtonsState extends State<_MoodRadioButtons> {
  var moodValues = {
    Mood.sad: false,
    Mood.neutral: true,
    Mood.happy: false,
  };

  _onMoodPressed(Mood selectedMood) {
    setState(() {
      moodValues
          .forEach((mood, value) => moodValues[mood] = mood == selectedMood);
    });
  }

  getMood() {
    moodValues.forEach((key, value) {
      if (moodValues[key]) return key;
    });
  }

  @override
  Widget build(BuildContext context) {
    return _moodBuilder();
  }

  _moodBuilder() {
    List<Widget> moodButtons = [];

    moodValues.forEach((mood, value) {
      final moodButton = Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: GestureDetector(
          onTap: () => _onMoodPressed(mood),
          child: AnimatedOpacity(
            opacity: value ? 1 : 0.6,
            duration: Duration(milliseconds: 700),
            child: Thought.getMoodPicture(mood),
          ),
        ),
      );

      moodButtons.add(moodButton);
    });

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: moodButtons,
    );
  }
}
