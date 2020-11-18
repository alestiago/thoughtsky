import 'package:at_challenge/components/quote.dart';
import 'package:at_challenge/constants/colors.dart';
import 'package:at_challenge/theme/app_text_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:at_challenge/models/thought.dart';

class ThoughtCard extends StatelessWidget {
  ThoughtCard(this.thought);

  final Thought thought;

  final theme = AppTextTheme.textTheme; //TODO: Use Theme.of(context)

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  _formatDate(thought.date),
                  style: theme.subtitle1.copyWith(color: kOnSurfaceLightColor),
                ),
                Text(
                  thought.title,
                  style: theme.headline4.copyWith(color: kOnSurfaceLightColor),
                ),
              ],
            ),
            Thought.getMoodPicture(thought.mood),
          ]),
          Padding(
            padding: EdgeInsets.only(top: 10, bottom: 5.0),
            child: Quote(Text(thought.content,
                style: theme.subtitle2.copyWith(color: kOnSurfaceLightColor))),
          ),
          Padding(
            padding: EdgeInsets.only(left: 10),
            child: Text(
              thought.author,
              style: theme.subtitle1.copyWith(color: kOnSurfaceLightColor),
            ),
          ),
        ],
      ),
      padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),
      decoration: BoxDecoration(
          color: kSurfaceLightColor,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: kElevationColor.withOpacity(0.7),
              blurRadius: 8,
              offset: Offset(0, 4),
            ),
          ]),
    );
  }

  String _formatDate(DateTime date) {
    return "${date.year.toString()}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}";
  }
}
