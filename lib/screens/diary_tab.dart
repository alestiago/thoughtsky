import 'package:at_challenge/components/thought_card.dart';
import 'package:at_challenge/constants/colors.dart';
import 'package:at_challenge/screens/submit_screen.dart';
import 'package:at_challenge/services/database_service.dart';
import 'package:at_challenge/theme/app_text_theme.dart';
import 'package:flutter/material.dart';

class DiaryTab extends StatelessWidget {
  final textTheme = AppTextTheme.textTheme;

  @override
  Widget build(BuildContext context) {
    DatabaseService databaseService = context.watch<DatabaseService>();

    return Scaffold(
      floatingActionButton: OpenContainerSubmitScreen(),
      body: Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(
            top: 15,
            left: 20,
            right: 20,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Your \nthoughts.",
                  style: textTheme.headline3
                      .copyWith(color: kOnSurfaceLightColor)),
              Expanded(
                child: ListView.builder(
                    itemCount: databaseService.yourThoughts.length,
                    itemBuilder: (context, index) => _thoughtCardBuilder(
                        context, index, databaseService.yourThoughts)),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _thoughtCardBuilder(BuildContext context, int index, thoughts) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: ThoughtCard(
        thoughts[index],
        showAuthor: false,
      ),
    );
  }
}
