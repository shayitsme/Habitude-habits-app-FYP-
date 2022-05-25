import 'package:flutter/cupertino.dart';


import 'package:login_with_signup/models/habit3.dart';

import '../models/habit5.dart';


class Habits5Provider extends ChangeNotifier {

  List<Habit5> _habits5 = [
    Habit5(
      createdTime: DateTime.now(),
      title: 'Buy some meat',
      description: '''- Eggs
- Milk
- Bread
- Water''',
    ),
    Habit5(
      createdTime: DateTime.now(),
      title: 'Plan family trip to Norway',
      description: '''- Rent some hotels
- Rent a car
- Pack suitcase''',
    ),
    Habit5(
      createdTime: DateTime.now(),
      title: 'Walk the Dog 🐕',
    ),
    Habit5(
      createdTime: DateTime.now(),
      title: 'Plan Jacobs birthday party 🎉🥳',
    ),
  ];
  List<Habit5> get habits5 => _habits5.where((habit5) => habit5.isDone == false).toList();

  void addHabit5(Habit5 habit5) {
    _habits5.add(habit5);

    notifyListeners();
  }
}