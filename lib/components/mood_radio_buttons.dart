import 'package:at_challenge/models/thought.dart';
import 'package:flutter/material.dart';

class MoodRadioController {
  Mood activeMood;
}

class MoodRadioButtons extends StatefulWidget {
  MoodRadioButtons(this.controller);

  final MoodRadioController controller;

  @override
  _MoodRadioButtonsState createState() => _MoodRadioButtonsState();
}

class _MoodRadioButtonsState extends State<MoodRadioButtons> {
  Map<Mood, bool> moodValues = {
    Mood.sad: false,
    Mood.neutral: true,
    Mood.happy: false,
  };

  _onMoodPressed(MoodRadioController controller, Mood selectedMood) {
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

  _moodBuilder(MoodRadioController controller) {
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
