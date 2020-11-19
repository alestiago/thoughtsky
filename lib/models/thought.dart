import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Thought {
  Thought({this.author, this.title, this.content, this.date, this.mood}) {
    this.key = author + date.toIso8601String();
  }

  final String author;
  final String title;
  final String content;
  final DateTime date;
  final Mood mood;
  String key;

  Map toJson() => {
        'key': author + date.toIso8601String(),
        'author': author,
        'title': title,
        'content': content,
        'date': date.toIso8601String(),
        'mood': mood.toString(),
      };

  factory Thought.fromJson(Map<String, dynamic> json) {
    return Thought(
      author: json["author"],
      title: json["title"],
      content: json["content"],
      date: DateTime.parse(json["date"]),
      mood: _enumFromString(json["mood"]),
    );
  }

  static Mood _enumFromString(String myEnum) {
    switch (myEnum) {
      case "Mood.happy":
        return Mood.happy;
      case "Mood.neutral":
        return Mood.neutral;
      case "Mood.sad":
        return Mood.sad;
      default:
        return Mood.neutral;
    }
  }

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

enum Mood { sad, neutral, happy }
