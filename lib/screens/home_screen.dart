import 'package:at_challenge/constants/colors.dart';
import 'package:at_challenge/screens/friends_screen.dart';
import 'package:flutter/material.dart';

import 'cloud_screen.dart';
import 'diary_screen.dart';

class HomeScreen extends StatelessWidget {
  static final id = "/home_screen";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: kSurfaceColor,
            bottom: TabBar(
              tabs: [
                Tab(icon: Icon(Icons.cloud)),
                Tab(icon: Icon(Icons.local_library)),
                Tab(icon: Icon(Icons.favorite)),
              ],
            ),
            centerTitle: true,
            title: Text(
              'Thoughtsky',
              style: Theme.of(context).textTheme.headline3,
              textAlign: TextAlign.right,
            ),
          ),
          body: TabBarView(
            children: [
              CloudScreen(),
              DiaryScreen(),
              FriendsScreen(),
            ],
          ),
        ),
      ),
    );
  }
}
