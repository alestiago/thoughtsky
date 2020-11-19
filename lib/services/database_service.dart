import 'dart:collection';
import 'dart:convert';

import 'package:at_challenge/models/thought.dart';
import 'package:at_challenge/services/server_demo_service.dart';
import 'package:at_commons/at_commons.dart';
import 'package:flutter/material.dart';
import 'package:at_challenge/utils/at_conf.dart' as conf;

export 'package:provider/provider.dart';

class DatabaseService extends ChangeNotifier {
  ServerDemoService _atClientService = ServerDemoService.getInstance();

  /// The atSign is update when the person authenticates.
  /// It is needed to used the @ protocol verbs for [AtKey]
  String _atSign = "@empty";

  /// List of mock-up thoughts that have been shared with the person.
  List<Thought> _friendThoughts = [
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
    Thought(
      title: 'Got the job!',
      date: DateTime.utc(2020, 11, 17),
      author: '@Ying',
      content:
          "Yes yes yes! I almost fainted after the call. I think this might be big for me, and I won't let myself down by not believing in myself. No impostor syndrome this time. Yay me!",
      mood: Mood.happy,
    ),
  ];

  /// List of mock-up thoughts uploaded by the person.
  List<Thought> _yourThoughts = [
    Thought(
      title: 'Christmas Dinner',
      date: DateTime.utc(2019, 12, 31),
      author: '@colin',
      content:
          "I should have trusted my gut instinct. They always give me a bad time. They're not the people I choose to spend my life with why should they tell me how to live it. Two more hours and I'll be done.",
      mood: Mood.sad,
    ),
    Thought(
      title: "This will be my year!",
      date: DateTime.utc(2020, 1, 3),
      author: '@colin',
      content:
          "I'm gonna work to make this my best year so far. Make it to the big galleries, treat myself with more kindness. These aren't resolutions, this is a new me.",
      mood: Mood.happy,
    ),
    Thought(
      title: 'Back home early.',
      date: DateTime.utc(2020, 1, 8),
      author: '@colin',
      content:
          "I feel like I've let @Frank down by leaving soon, but I couldn't stand it any longer. I didn't want to be with them. Why can't I just have fun like other people do?",
      mood: Mood.neutral,
    ),
    Thought(
      title: 'My team won!',
      date: DateTime.utc(2020, 2, 10),
      author: '@colin',
      content:
          "The match was tight. @NoahOnassis scored the decisive goal in the last minute, she was absolutely spectacular tonight. It's given the team hope to get into nationals! We're defo partying tonight.",
      mood: Mood.happy,
    ),
  ];

  /// List of mock-up @signs of the person.
  List<String> _friends = [
    "@Alejandro",
    "@Lucas",
    "@John",
    "@Alice",
    "@Bob",
  ];

  get atSign => _atSign;
  get friends => UnmodifiableListView(_friends);
  get friendThoughts {
    return UnmodifiableListView(_orderThoughtsChronologically(_friendThoughts));
  }

  get yourThoughts {
    List<Thought> mockUpThoughts = _yourThoughts;
    return UnmodifiableListView(_orderThoughtsChronologically(mockUpThoughts));

    //    List<Thought> serverThoughts = await _readYourThoughts();
//    List<Thought> thoughts = new List.from(mockUpThoughts)
//      ..addAll(serverThoughts);
  }

  int calculateStats(Mood mood) {
    int counter = 0;
    _yourThoughts.forEach((thought) {
      if (thought.mood == mood) counter++;
    });
    return counter;
  }

  addFriend(String atSign) {
    _friends.add(atSign);
    notifyListeners();
  }

  // TODO: Implement this to check the date field and order the list accordingly.
  _orderThoughtsChronologically(List<Thought> list) {
    return list.reversed;
  }

  // TODO: Use an AuthenticateService with a [StreamProvider] to update Auth changes.
  void logIn(String atSign) {
    _atSign = atSign;
    notifyListeners();
  }

  writeThought(Thought thought) async {
    _yourThoughts.add(thought); // This add the thought to the mock up list.
    // await _update(thought.key, json.encode(thought));
    notifyListeners();
  }

  shareThought(Thought tought, String atSign) async {}

  _readYourThoughts() async {
    List<Thought> retrievedThoughts = [];

    print("Database Service: Starting to scan keys from server");

    final List<String> thoughtKeys = await _scan();
    if (thoughtKeys == [] || thoughtKeys == null) {
      print("Database Service: No keys were found");
      return thoughtKeys;
    }

    thoughtKeys.forEach((key) async {
      String jsonValue = await _lookup(key);
      Thought thought = Thought.fromJson(jsonDecode(jsonValue));
      retrievedThoughts.add(thought);
    });

    return retrievedThoughts;
  }

  Future<dynamic> _scanServerThoughts() async {
    List<String> jsonScannedThoughts = await _scan();
    if (jsonScannedThoughts == [] || jsonScannedThoughts == null) {
      print("Database Service: No keys were found");
      return jsonScannedThoughts;
    }

    // If successfully scanned some keys, attempts to decode them from JSON
    // to a [Thought] object.
    List<Thought> scannedThoughts = [];
    jsonScannedThoughts.forEach((jsonThought) {
      scannedThoughts.add(Thought.fromJson(jsonDecode(jsonThought)));
    });

    return scannedThoughts;
  }

  /// Create instance of an AtKey and pass that
  /// into the put() method with the corresponding
  /// _value string.
  _update(key, String value) async {
    if (key != null && value != null) {
      AtKey pair = AtKey();
      pair.key = key;
      pair.sharedWith = atSign;
      await _atClientService.put(pair, value);
      print("Successfully added $key and $value");
    }
  }

  /// getKeys() corresponding to the keys shared by [atSign].
  /// Strip any meta data away from the retrieves keys. Store
  /// the keys into [_scanItems].
  _scan() async {
    List<String> response = await _atClientService.getKeys(sharedBy: atSign);

    if (response.length > 0) {
      List<String> scanList = response
          .map((key) => key
              .replaceAll('.' + conf.namespace + atSign, '')
              .replaceAll(atSign + ':', ''))
          .toList();

      print("Finished scan with result $scanList");
      return scanList;
    }
  }

  /// Create instance of an AtKey and call get() on it.
  _lookup(lookupKey) async {
    if (lookupKey != null) {
      AtKey lookup = AtKey();
      lookup.key = lookupKey;
      lookup.sharedWith = atSign;
      String response = await _atClientService.get(lookup);
      if (response != null) {
        return response;
      } else {
        print("Database Service: Look up failed due to null key.");
      }
    }
  }
}
