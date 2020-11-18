import 'package:at_challenge/models/thought.dart';

class DatabaseService {
  List<Thought> getFriendThoughts = [
    Thought(
      title: 'Got the job!',
      date: DateTime.utc(2020, 11, 17),
      author: '@Ying',
      content:
          "Yes yes yes! I almost fainted after the call. I think this might be big for me, and I won't let myself down by not believing in myself. No impostor syndrome this time. Yay me!",
      mood: Mood.happy,
    ),
    Thought(
      title: 'Long morning.',
      date: DateTime.utc(1989, 11, 9),
      author: '@Frank',
      content:
          "Jacob keeps throwing more work at me every ten minutes. It's piling up on my desk. Maybe today will be the day I finally quit and take accountability for my own life.",
      mood: Mood.sad,
    ),
    Thought(
      title: 'Why?.',
      date: DateTime.utc(1989, 11, 9),
      author: '@Mike',
      content:
          "I keep asking myself WHY I don't let people in. I think sharing more of these might help me be more transparent with you guys. Trust me, it's not that I don't trust you with my thoughts.",
      mood: Mood.neutral,
    ),
    Thought(
      title: 'Sensitivity.',
      date: DateTime.utc(1989, 11, 9),
      author: '@NoahOnassis',
      content:
          "I've realised that, if I can't control how deeply I feel things I might be able to control how I let they affect me. Maybe I can't stop the pain but I can learn to learn to live with it.",
      mood: Mood.happy,
    ),
  ];
}
