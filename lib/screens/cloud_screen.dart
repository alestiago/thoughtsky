import 'package:at_challenge/components/thought_card.dart';
import 'package:at_challenge/services/database_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CloudScreen extends StatelessWidget {
  static final id = "/cloud_screen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView.builder(
            itemCount: DatabaseService().getFriendThoughts.length,
            itemBuilder: _thoughtCartBuilder));
  }

  Widget _thoughtCartBuilder(BuildContext context, int index) {
    final thoughts = DatabaseService().getFriendThoughts;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      child: ThoughtCard(thoughts[index]),
    );
  }
}
