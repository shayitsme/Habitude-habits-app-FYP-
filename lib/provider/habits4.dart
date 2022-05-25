import 'package:flutter/cupertino.dart';


import 'package:login_with_signup/models/habit3.dart';
import 'package:login_with_signup/models/habit4.dart';


class Habits4Provider extends ChangeNotifier {

  List<Habit4> _habits4 = [
    Habit4(
      createdTime: DateTime.now(),
      title: 'Buy some meat',
      description: '''- Eggs
- Milk
- Bread
- Water''',
    ),
    Habit4(
      createdTime: DateTime.now(),
      title: 'Plan family trip to Norway',
      description: '''- Rent some hotels
- Rent a car
- Pack suitcase''',
    ),
    Habit4(
      createdTime: DateTime.now(),
      title: 'Walk the Dog 🐕',
    ),
    Habit4(
      createdTime: DateTime.now(),
      title: 'Plan Jacobs birthday party 🎉🥳',
    ),
  ];
  List<Habit4> get habits4 => _habits4.where((habit4) => habit4.isDone == false).toList();

  void addHabit4(Habit4 habit4) {
    _habits4.add(habit4);

    notifyListeners();
  }
}