import 'package:at_challenge/models/thought.dart';

class DatabaseService {
  get friendThoughts {
    return [
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
        date: DateTime.utc(2020, 11, 9),
        author: '@Frank',
        content:
            "@Jacob keeps throwing more work at me every ten minutes. It's piling up on my desk. Maybe today will be the day I finally quit and take accountability for my own life.",
        mood: Mood.sad,
      ),
      Thought(
        title: 'Why?',
        date: DateTime.utc(2020, 11, 9),
        author: '@Mike',
        content:
            "I keep asking myself WHY I don't let people in. I think sharing more of these might help me be more transparent with you guys. Trust me, it's not that I don't trust you with my thoughts.",
        mood: Mood.neutral,
      ),
      Thought(
        title: 'Sensitivity.',
        date: DateTime.utc(2020, 11, 9),
        author: '@NoahOnassis',
        content:
            "I've realised that, if I can't control how deeply I feel things I might be able to control how I let they affect me. Maybe I can't stop the pain but I can learn to learn to live with it.",
        mood: Mood.happy,
      ),
    ];
  }

  get yourThoughts {
    return [
      Thought(
        title: 'Christmas Dinner',
        date: DateTime.utc(2019, 12, 31),
        author: '@Lucas',
        content:
            "I should have trusted my gut instinct. They always give me a bad time. They're not the people I choose to spend my life with why should they tell me how to live it. Two more hours and I'll be done.",
        mood: Mood.sad,
      ),
      Thought(
        title: "This will be my year!",
        date: DateTime.utc(2020, 1, 3),
        author: '@Lucas',
        content:
            "I'm gonna work to make this my best year so far. Make it to the big galleries, treat myself with more kindness. These aren't resolutions, this is a new me.",
        mood: Mood.happy,
      ),
      Thought(
        title: 'Back home early.',
        date: DateTime.utc(2020, 1, 8),
        author: '@Lucas',
        content:
            "I feel like I've let @Frank down by leaving soon, but I couldn't stand it any longer. I didn't want to be with them. Why can't I just have fun like other people do?",
        mood: Mood.neutral,
      ),
      Thought(
        title: 'My team won!',
        date: DateTime.utc(2020, 2, 10),
        author: '@Lucas',
        content:
            "The match was tight. @NoahOnassis scored the decisive goal in the last minute, she was absolutely spectacular tonight. It's given the team hope to get into nationals! We're defo partying tonight.",
        mood: Mood.happy,
      ),
    ];
  }
}
