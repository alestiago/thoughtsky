import 'package:at_challenge/components/thought_card.dart';
import 'package:at_challenge/constants/colors.dart';
import 'package:at_challenge/services/database_service.dart';
import 'package:at_challenge/theme/app_text_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CloudTab extends StatelessWidget {
  final textTheme = AppTextTheme.textTheme;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(
          top: 15,
          left: 20,
          right: 20,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Friend's\nthoughts.",
                style:
                    textTheme.headline3.copyWith(color: kOnSurfaceLightColor)),
            Expanded(
              child: ListView.builder(
                  itemCount: DatabaseService().friendThoughts.length,
                  itemBuilder: _thoughtCardBuilder),
            ),
          ],
        ),
      ),
    );
  }

  Widget _thoughtCardBuilder(BuildContext context, int index) {
    final thoughts = DatabaseService().friendThoughts;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: ThoughtCard(thoughts[index]),
    );
  }
}
