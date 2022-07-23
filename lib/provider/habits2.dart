import 'package:flutter/cupertino.dart';

import 'package:login_with_signup/models/habit2.dart';


class Habits2Provider extends ChangeNotifier {

  List<Habit2> _habits2 = [
    Habit2(
      createdTime: DateTime.now(),
      title: 'Prayers',
      description: '''
''',
    ),

    Habit2(
      createdTime: DateTime.now(),
      title: 'Fajr (Sunrise Prayer)',
      description: '''5.55a.m.
''',
    ),
    Habit2(
      createdTime: DateTime.now(),
      title: 'Dhuhr (Noon Prayer)',
      description: ''' 13.20p.m.
''',
    ),
    Habit2(
      createdTime: DateTime.now(),
      title: 'Asr (Afternoon Prayer)',
      description: '''16.44p.m.
''',
    ),
    Habit2(
      createdTime: DateTime.now(),
      title: 'Maghrib (Sunset Prayer)',
      description: '''7.28p.m.
''',
    ),
    Habit2(
      createdTime: DateTime.now(),
      title: 'Isha (Night Prayer)',
      description: '''8.58p.m.
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

  void updateHabit2(Habit2 habit2, String title, String description) {
    habit2.title = title;
    habit2.description = description;

    notifyListeners();
  }
}
