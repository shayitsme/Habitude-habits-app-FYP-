import 'package:flutter/cupertino.dart';


import '../models/habit6.dart';


class Habits6Provider extends ChangeNotifier {

  List<Habit6> _habits6 = [
    Habit6(
      createdTime: DateTime.now(),
      title: 'Woke up early today',
      description: '''Did not sleep in''',
    ),
    Habit6(
      createdTime: DateTime.now(),
      title: 'Did not procrastinate today',
      description: '''Read 5 pages today to curb procrastination''',
    ),
    Habit6(
      createdTime: DateTime.now(),
      title: 'Did not smoke today',
      description: '''Chewed a gum everytime I needed to smoke''',
    ),
    Habit6(
      createdTime: DateTime.now(),
      title: 'Did not play video games every hour today',
      description: '''Played only for 3 hours today
- Substituted gaming with active video learning
''',
    ),
  ];

  List<Habit6> get habits6 =>
      _habits6.where((habit6) => habit6.isDone == false).toList();

  List<Habit6> get habits6Completed =>
      _habits6.where((habit6) => habit6.isDone == true).toList();

  void addHabit6(Habit6 habit6) {
    _habits6.add(habit6);

    notifyListeners();
  }

  void removeHabit6(Habit6 habit6) {
    _habits6.remove(habit6);

    notifyListeners();
  }
  bool toggleHabit6Status(Habit6 habit6) {
    habit6.isDone = !habit6.isDone;
    notifyListeners();

    return habit6.isDone;
}
  void updateHabit6(Habit6 habit6, String title, String description) {
    habit6.title = title;
    habit6.description = description;

    notifyListeners();
  }
}