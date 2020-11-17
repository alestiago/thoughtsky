class Thought {
  Thought({this.author, this.title, this.content, this.date, this.mood});

  final String author;
  final String title;
  final String content;
  final DateTime date;
  final Mood mood;
}

enum Mood { sad, neutral, happy }
