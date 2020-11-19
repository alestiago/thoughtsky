import 'package:at_challenge/components/app_raised_button.dart';
import 'package:at_challenge/components/app_text_field.dart';
import 'package:at_challenge/constants/colors.dart';
import 'package:at_challenge/models/thought.dart';
import 'package:at_challenge/services/database_service.dart';
import 'package:at_challenge/theme/app_text_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfileTab extends StatelessWidget {
  final TextTheme textTheme = AppTextTheme.textTheme;

  @override
  Widget build(BuildContext context) {
    DatabaseService databaseService = context.watch<DatabaseService>();

    return Scaffold(
      resizeToAvoidBottomInset: false,
      resizeToAvoidBottomPadding: false,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(databaseService.atSign,
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
  final textTheme = AppTextTheme.textTheme;

  @override
  Widget build(BuildContext context) {
    DatabaseService databaseService = context.watch<DatabaseService>();

    List<Widget> moodButtons = [];

    final Map<Mood, int> moodStats = {
      Mood.sad: databaseService.calculateStats(Mood.sad),
      Mood.neutral: databaseService.calculateStats(Mood.neutral),
      Mood.happy: databaseService.calculateStats(Mood.happy),
    };

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

class _FriendContainer extends StatefulWidget {
  @override
  __FriendContainerState createState() => __FriendContainerState();
}

class __FriendContainerState extends State<_FriendContainer> {
  final textTheme = AppTextTheme.textTheme;
  final fieldTextController = TextEditingController();

  String friendName = "";

  @override
  Widget build(BuildContext context) {
    DatabaseService databaseService = context.watch<DatabaseService>();

    // Events
    onChangeFriendName(value) {
      setState(() {
        friendName = value;
      });
    }

    onAddFriend() {
      if (friendName.isEmpty) return;
      databaseService.addFriend(friendName);

      fieldTextController.clear();
      FocusScopeNode currentFocus = FocusScope.of(context);
      if (!currentFocus.hasPrimaryFocus) {
        currentFocus.unfocus();
      }
    }

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
                        controller: fieldTextController,
                        onChange: onChangeFriendName,
                        hintText: "@name",
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    AppRaisedButton(
                      onPressed: onAddFriend,
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
              friends: databaseService.friends,
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
