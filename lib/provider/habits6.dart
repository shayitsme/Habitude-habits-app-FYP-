import 'package:flutter/cupertino.dart';


import '../models/habit6.dart';


class Habits6Provider extends ChangeNotifier {

  List<Habit6> _habits6 = [
    Habit6(
      createdTime: DateTime.now(),
      title: 'I want to stop procrastinating',
      description: '''- Read 5 pages everyday to stop procrastination''',
    ),
    Habit6(
      createdTime: DateTime.now(),
      title: 'I want to stop playing video games every hour',
      description: '''- Play only for 2 hours a day
- Substitute gaming with active video learning
''',
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