import 'package:flutter/cupertino.dart';


import 'package:login_with_signup/models/habit3.dart';

import '../models/habit5.dart';


class Habits5Provider extends ChangeNotifier {

  List<Habit5> _habits5 = [
    Habit5(
      createdTime: DateTime.now(),
      title: 'Slept early yesterday',
      description: '''- No phone before bedtime''',
    ),
    Habit5(
      createdTime: DateTime.now(),
      title: 'Slept for 7 hours yesterday',
      description: '''- Had an uninterrupted sleep''',
    ),
  ];
  List<Habit5> get habits5 => _habits5.where((habit5) => habit5.isDone == false).toList();

  void addHabit5(Habit5 habit5) {
    _habits5.add(habit5);

    notifyListeners();
  }

  void removeHabit5(Habit5 habit5) {
    _habits5.remove(habit5);

    notifyListeners();
  }
}