import 'package:flutter/cupertino.dart';

import 'package:login_with_signup/models/habit2.dart';


class Habits2Provider extends ChangeNotifier {

  List<Habit2> _habits2 = [
    Habit2(
      createdTime: DateTime.now(),
      title: 'Meditate today',
      description: '''- 10 minutes alone time
''',
    ),
    Habit2(
      createdTime: DateTime.now(),
      title: 'Do sound healing today',
      description: '''
''',
    ),

  ];

  List<Habit2> get habit2 =>
      _habits2.where((habit2) => habit2.isDone == false).toList();

  List<Habit2> get habits2Completed =>
      _habits2.where((habit2) => habit2.isDone == true).toList();

  void addHabit2(Habit2 habit2) {
    _habits2.add(habit2);

    notifyListeners();
  }


  void removeHabit2(Habit2 habit2) {
    _habits2.remove(habit2);

    notifyListeners();
  }

  bool toggleHabit2Status(Habit2 habit2) {
    habit2.isDone = !habit2.isDone;
    notifyListeners();

    return habit2.isDone;
  }
}
