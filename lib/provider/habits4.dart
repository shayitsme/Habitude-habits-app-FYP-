import 'package:flutter/cupertino.dart';

import 'package:login_with_signup/models/habit4.dart';


class Habits4Provider extends ChangeNotifier {

  List<Habit4> _habits4 = [
    Habit4(
      createdTime: DateTime.now(),
      title: 'Exercised for 30 minutes today',
      description: '''- Watch favourite trainer on Youtube''',
    ),
    Habit4(
      createdTime: DateTime.now(),
      title: 'Do some running/ walking today',
      description: ''' ''',
    ),
  ];
  List<Habit4> get habits4 => _habits4.where((habit4) => habit4.isDone == false).toList();

  void addHabit4(Habit4 habit4) {
    _habits4.add(habit4);

    notifyListeners();
  }

  void removeHabit4(Habit4 habit4) {
    _habits4.remove(habit4);

    notifyListeners();
  }
}