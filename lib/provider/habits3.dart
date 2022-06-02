import 'package:flutter/cupertino.dart';


import 'package:login_with_signup/models/habit3.dart';


class Habits3Provider extends ChangeNotifier {

  List<Habit3> _habits3 = [
    Habit3(
      createdTime: DateTime.now(),
      title: 'Buy some meat',
      description: '''- Eggs
- Milk
- Bread
- Water''',
    ),
    Habit3(
      createdTime: DateTime.now(),
      title: 'Plan family trip to Norway',
      description: '''- Rent some hotels
- Rent a car
- Pack suitcase''',
    ),
    Habit3(
      createdTime: DateTime.now(),
      title: 'Walk the Dog 🐕',
    ),
    Habit3(
      createdTime: DateTime.now(),
      title: 'Plan Jacobs birthday party 🎉🥳',
    ),
  ];
  List<Habit3> get habits3 => _habits3.where((habit3) => habit3.isDone == false).toList();

  void addHabit3(Habit3 habit3) {
    _habits3.add(habit3);

    notifyListeners();
  }
  void removeHabit3(Habit3 habit3) {
    _habits3.remove(habit3);

    notifyListeners();
  }
}