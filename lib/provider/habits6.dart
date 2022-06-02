import 'package:flutter/cupertino.dart';


import '../models/habit6.dart';


class Habits6Provider extends ChangeNotifier {

  List<Habit6> _habits6 = [
    Habit6(
      createdTime: DateTime.now(),
      title: 'Buy some meat',
      description: '''- Eggs
- Milk
- Bread
- Water''',
    ),
    Habit6(
      createdTime: DateTime.now(),
      title: 'Plan family trip to Norway',
      description: '''- Rent some hotels
- Rent a car
- Pack suitcase''',
    ),
    Habit6(
      createdTime: DateTime.now(),
      title: 'Walk the Dog 🐕',
    ),
    Habit6(
      createdTime: DateTime.now(),
      title: 'Plan Jacobs birthday party 🎉🥳',
    ),
  ];
  List<Habit6> get habits6 => _habits6.where((habit6) => habit6.isDone == false).toList();

  void addHabit6(Habit6 habit6) {
    _habits6.add(habit6);

    notifyListeners();
  }

  void removeHabit6(Habit6 habit6) {
    _habits6.remove(habit6);

    notifyListeners();
  }
}