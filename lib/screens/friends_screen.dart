import 'package:at_challenge/components/app_raised_button.dart';
import 'package:at_challenge/components/app_text_field.dart';
import 'package:at_challenge/constants/colors.dart';
import 'package:at_challenge/models/thought.dart';
import 'package:at_challenge/theme/app_text_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FriendsScreen extends StatelessWidget {
  static final id = "/friends_screen";

  final TextTheme textTheme = AppTextTheme.textTheme;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      resizeToAvoidBottomPadding: false,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text('@Lucas',
                textAlign: TextAlign.center,
                style: textTheme.headline4.copyWith(color: kOnBackgroundColor)),
            _MoodStats(),
            _FriendContainer(),
          ],
        ),
      ),
    );
  }
}

class _MoodStats extends StatelessWidget {
  final Map<Mood, int> moodStats = {
    Mood.sad: 32,
    Mood.neutral: 67,
    Mood.happy: 41,
  };

  final textTheme = AppTextTheme.textTheme;

  @override
  Widget build(BuildContext context) {
    List<Widget> moodButtons = [];

    moodStats.forEach((mood, value) {
      Widget moodButton = Padding(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: Column(
          children: [
            Thought.getMoodPicture(mood),
            Text(
              value.toString(),
              style: textTheme.headline5.copyWith(color: kOnBackgroundColor),
            )
          ],
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

class _FriendContainer extends StatelessWidget {
  final textTheme = AppTextTheme.textTheme;
  final friends = [
    "Alejandro",
    "Lucas",
    "John",
    "Alice",
    "Bob",
  ];

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
      padding: EdgeInsets.all(20.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Column(
              children: [
                Text(
                  'Your clouds.',
                  style:
                      textTheme.headline4.copyWith(color: kOnSurfaceLightColor),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Expanded(
                      child: AppTextField(
                        hintText: "@name",
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    AppRaisedButton(
                      title: "ADD",
                      backgroundColor: kOnSurfaceLightColor,
                      foregroundColor: kBackgroundColor,
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 40,
            ),
            _FriendList(
              friends: friends,
            )
          ],
        ),
      ),
      decoration: BoxDecoration(
          color: kSurfaceLightColor, borderRadius: BorderRadius.circular(20.0)),
    ));
  }
}

class _FriendList extends StatelessWidget {
  _FriendList({@required this.friends});

  final List<String> friends;

  final TextTheme textTheme = AppTextTheme.textTheme;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        primary: false,
        shrinkWrap: true,
        itemCount: friends.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 5),
            decoration: BoxDecoration(
              border:
                  Border(bottom: BorderSide(color: kSurfaceColor, width: 1)),
            ),
            child: Padding(
              padding: EdgeInsets.only(left: 10, bottom: 3),
              child: Text(
                friends[index],
                style:
                    textTheme.headline6.copyWith(color: kOnSurfaceLightColor),
              ),
            ),
          );
        });
  }
}
