import 'package:flutter/cupertino.dart';

import 'package:login_with_signup/models/habit2.dart';


class Habits2Provider extends ChangeNotifier {

  List<Habit2> _habits2 = [
    Habit2(
      createdTime: DateTime.now(),
      title: 'Buy some chick',
      description: '''- Eggs
- Milk
- Bread
- Water''',
    ),
    Habit2(
      createdTime: DateTime.now(),
      title: 'Plan family trip to Norway',
      description: '''- Rent some hotels
- Rent a car
- Pack suitcase''',
    ),
    Habit2(
      createdTime: DateTime.now(),
      title: 'Walk the Dog 🐕',
    ),
    Habit2(
      createdTime: DateTime.now(),
      title: 'Plan Jacobs birthday party 🎉🥳',
    ),
  ];
  List<Habit2> get habit2 => _habits2.where((habit2) => habit2.isDone == false).toList();

  void addHabit2(Habit2 habit2) {
    _habits2.add(habit2);

    notifyListeners();
  }
}