import 'package:animations/animations.dart';
import 'package:at_challenge/components/app_raised_button.dart';
import 'package:at_challenge/components/app_text_field.dart';
import 'package:at_challenge/components/mood_radio_buttons.dart';
import 'package:at_challenge/constants/colors.dart';
import 'package:at_challenge/models/thought.dart';
import 'package:at_challenge/theme/app_text_theme.dart';
import 'package:at_challenge/utils/date_util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:at_challenge/services/database_service.dart';

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
  String title = "";
  String content = "";

  @override
  Widget build(BuildContext context) {
    final textTheme = AppTextTheme.textTheme; // TODO: use Theme.of(context)
    DatabaseService databaseService = context.watch<DatabaseService>();

    // Controller
    MoodRadioController moodRadioController = MoodRadioController();

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

    Thought createThought() {
      return Thought(
        title: title,
        date: DateTime.now(),
        author: databaseService.atSign,
        content: content,
        mood: moodRadioController.activeMood ?? Mood.neutral,
      );
    }

    void onSave() async {
      final Thought thought = createThought();
      await databaseService.writeThought(thought);
      onClose();
    }

    void onSend() {
      onClose();
      onSave();
    }

    void onShare() {
      displayModalBottomSheet(context, onSend, databaseService);
    }

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
                      DateUtil.formatDateToString(DateTime.now(),
                          showWeekly: false),
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
                  child: MoodRadioButtons(moodRadioController),
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

  void displayModalBottomSheet(context, Function onSend, databaseService) {
    final TextTheme textTheme = AppTextTheme.textTheme;

    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return Container(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(color: kSurfaceLightColor),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Share with',
                  style:
                      textTheme.headline3.copyWith(color: kOnSurfaceLightColor),
                ),
                ListView.builder(
                    primary: false,
                    shrinkWrap: true,
                    itemCount: databaseService.friends.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        margin:
                            EdgeInsets.symmetric(horizontal: 20.0, vertical: 5),
                        decoration: BoxDecoration(
                          border: Border(
                              bottom:
                                  BorderSide(color: kSurfaceColor, width: 1)),
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(left: 10, bottom: 3),
                          child: Text(
                            databaseService.friends[index],
                            style: textTheme.headline6
                                .copyWith(color: kOnSurfaceLightColor),
                          ),
                        ),
                      );
                    }),
                AppRaisedButton(
                  onPressed: onSend,
                  foregroundColor: kSurfaceLightColor,
                  backgroundColor: kOnSurfaceLightColor,
                  title: 'Send',
                )
              ],
            ),
          );
        });
  }
}
