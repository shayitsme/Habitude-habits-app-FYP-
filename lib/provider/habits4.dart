import 'package:flutter/cupertino.dart';

import 'package:login_with_signup/models/habit4.dart';


class Habits4Provider extends ChangeNotifier {

  List<Habit4> _habits4 = [
    Habit4(
      createdTime: DateTime.now(),
      title: 'Exercised for 30 minutes today',
      description: '''Followed a fitness video on Youtube''',
    ),
    Habit4(
      createdTime: DateTime.now(),
      title: 'Did some running or walking today',
      description: '''Went to the gym or walked around the area ''',
    ),
    Habit4(
      createdTime: DateTime.now(),
      title: 'Did stretching before and after exercise',
      description: '''10 minutes session ''',
    ),
    Habit4(
      createdTime: DateTime.now(),
      title: 'Took necessary breaks in between exercises',
      description: '''Did not exert yourself''',
    ),
  ];

  List<Habit4> get habits4 =>
      _habits4.where((habit4) => habit4.isDone == false).toList();

  List<Habit4> get habits4Completed =>
      _habits4.where((habit4) => habit4.isDone == true).toList();

  void addHabit4(Habit4 habit4) {
    _habits4.add(habit4);

    notifyListeners();
  }

  void removeHabit4(Habit4 habit4) {
    _habits4.remove(habit4);

    notifyListeners();
  }

  bool toggleHabit4Status(Habit4 habit4) {
    habit4.isDone = !habit4.isDone;
    notifyListeners();

    return habit4.isDone;
  }
  void updateHabit4(Habit4 habit4, String title, String description) {
    habit4.title = title;
    habit4.description = description;

    notifyListeners();
  }
}