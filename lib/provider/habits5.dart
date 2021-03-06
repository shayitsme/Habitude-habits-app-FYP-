import 'package:flutter/cupertino.dart';


import 'package:login_with_signup/models/habit3.dart';

import '../models/habit5.dart';


class Habits5Provider extends ChangeNotifier {

  List<Habit5> _habits5 = [
    Habit5(
      createdTime: DateTime.now(),
      title: 'Slept early yesterday',
      description: '''No phone before bedtime''',
    ),
    Habit5(
      createdTime: DateTime.now(),
      title: 'Slept for 7 hours yesterday',
      description: '''Had an uninterrupted sleep''',
    ),
    Habit5(
      createdTime: DateTime.now(),
      title: 'Calmed my thoughts before going to sleep',
      description: '''No negativity kept me awake last night''',
    ),
  ];

  List<Habit5> get habits5 =>
      _habits5.where((habit5) => habit5.isDone == false).toList();

  List<Habit5> get habits5Completed =>
      _habits5.where((habit5) => habit5.isDone == true).toList();

  void addHabit5(Habit5 habit5) {
    _habits5.add(habit5);

    notifyListeners();
  }

  void removeHabit5(Habit5 habit5) {
    _habits5.remove(habit5);

    notifyListeners();
  }
  bool toggleHabit5Status(Habit5 habit5) {
    habit5.isDone = !habit5.isDone;
    notifyListeners();

    return habit5.isDone;
  }
  void updateHabit5(Habit5 habit5, String title, String description, DateTime createdTime) {
    habit5.title = title;
    habit5.description = description;
    habit5.createdTime = createdTime;

    notifyListeners();
  }
}