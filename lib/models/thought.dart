import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Thought {
  Thought({this.author, this.title, this.content, this.date, this.mood});

  final String author;
  final String title;
  final String content;
  final DateTime date;
  final Mood mood;

  Map toJson() => {
        'key': author + date.toIso8601String(),
        'author': author,
        'title': title,
        'content': content,
        'date': date.toIso8601String(),
        'mood': mood.toString(),
      };

  // ignore: missing_return
  static Widget getMoodPicture(Mood mood) {
    switch (mood) {
      case Mood.sad:
        return SvgPicture.asset('assets/img/mood_sad.svg');
      case Mood.neutral:
        return SvgPicture.asset('assets/img/mood_neutral.svg');
      case Mood.happy:
        return SvgPicture.asset('assets/img/mood_happy.svg');
    }
  }
}

Thought thoughtFromJson(Map<String, dynamic> json) {
  return Thought(
    author: json["author"],
    title: json["title"],
    content: json["content"],
    date: DateTime.parse(json["date"]),
    mood: Mood.happy,
  );
}

enum Mood { sad, neutral, happy }
