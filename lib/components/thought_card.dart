import 'package:at_challenge/components/quote.dart';
import 'package:at_challenge/constants/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ThoughtCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Wed 17 Nov'),
          Text('Long morning.'),
          Quote(Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin mattis leo sit amet lectus vehicula, id ornare ante lobortis. Morbi tortor turpis, pharetra ut auctor.'))
        ],
      ),
      padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),
      decoration: BoxDecoration(
        color: kSurfaceColor,
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}
