import 'package:animations/animations.dart';
import 'package:at_challenge/components/app_raised_button.dart';
import 'package:at_challenge/components/app_text_field.dart';
import 'package:at_challenge/constants/colors.dart';
import 'package:at_challenge/models/thought.dart';
import 'package:at_challenge/theme/app_text_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OpenContainerSubmitScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return OpenContainer(
      transitionDuration: Duration(milliseconds: 500),
      openColor: kAccentColor,
      openBuilder: (context, closedContainer) {
        return SubmitScreen();
      },
      closedShape: CircleBorder(),
      closedElevation: 10,
      closedColor: Colors.transparent,
      closedBuilder: (context, openContainer) {
        return CircleAvatar(
          radius: 30,
          backgroundColor: kAccentColor,
          child: Icon(
            Icons.brush,
            color: kOnAccentColor,
            size: 30,
          ),
        );
      },
    );
  }
}

class SubmitScreen extends StatefulWidget {
  static const id = "/submit_screen";

  @override
  _SubmitScreenState createState() => _SubmitScreenState();
}

class _SubmitScreenState extends State<SubmitScreen> {
  final String sadMoodAssetName = 'assets/img/mood_sad.svg';
  final String neutralMoodAssetName = 'assets/img/mood_neutral.svg';
  final String happyMoodAssetName = 'assets/img/mood_happy.svg';

  String title = "";
  String content = "";

  @override
  Widget build(BuildContext context) {
    final textTheme = AppTextTheme.textTheme; // TODO: use Theme.of(context)

    // Controller
    _MoodRadioController moodRadioController = _MoodRadioController();

    // Event Handlers
    void onClose() => Navigator.pop(context);

    void onChangeTitle(value) {
      setState(() {
        title = value;
      });
    }

    void onChangeContent(value) {
      setState(() {
        content = value;
      });
    }

    void createThought() {
      print(title);
      print(content);
      print(moodRadioController.activeMood);
    }

    void onSave() {
      createThought();
    }

    void onShare() {}

    return Scaffold(
      backgroundColor: kAccentColor,
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
                      top: 30.0, left: 50.0, bottom: 10.0, right: 50.0),
                  child: _MoodRadioButtons(moodRadioController),
                ),
                AppTextField(
                  onChange: onChangeTitle,
                  hintText: "Title",
                  textStyle: textTheme.headline4,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: AppTextField(
                    onChange: onChangeContent,
                    textStyle: textTheme.subtitle2,
                    hintText: "Today I feel...",
                    maxLines: 4,
                    maxLength: 140,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: AppRaisedButton(
                        foregroundColor: kOnSurfaceLightColor,
                        backgroundColor: kSurfaceLightColor,
                        title: "Save",
                        onPressed: onSave,
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Center(
                      child: AppRaisedButton(
                        foregroundColor: kOnSurfaceLightColor,
                        backgroundColor: kSurfaceLightColor,
                        title: "Share",
                        onPressed: onShare,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _MoodRadioController {
  Mood activeMood;
}

class _MoodRadioButtons extends StatefulWidget {
  _MoodRadioButtons(this.controller);

  final _MoodRadioController controller;

  @override
  _MoodRadioButtonsState createState() => _MoodRadioButtonsState();
}

class _MoodRadioButtonsState extends State<_MoodRadioButtons> {
  Map<Mood, bool> moodValues = {
    Mood.sad: false,
    Mood.neutral: true,
    Mood.happy: false,
  };

  _onMoodPressed(_MoodRadioController controller, Mood selectedMood) {
    setState(() {
      moodValues
          .forEach((mood, value) => moodValues[mood] = mood == selectedMood);
    });

    moodValues.forEach((key, value) {
      if (moodValues[key]) controller.activeMood = key;
    });
  }

  @override
  Widget build(BuildContext context) {
    return _moodBuilder(widget.controller);
  }

  _moodBuilder(_MoodRadioController controller) {
    List<Widget> moodButtons = [];

    moodValues.forEach((mood, value) {
      final moodButton = Padding(
        padding: const EdgeInsets.only(
          top: 15,
          left: 5,
          right: 5,
        ),
        child: GestureDetector(
          onTap: () => _onMoodPressed(controller, mood),
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
