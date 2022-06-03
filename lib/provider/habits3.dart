import 'package:flutter/cupertino.dart';


import 'package:login_with_signup/models/habit3.dart';


class Habits3Provider extends ChangeNotifier {

  List<Habit3> _habits3 = [
    Habit3(
      createdTime: DateTime.now(),
      title: 'Did not skip breakfast',
      description: ''' - Ate before 8.30am
      ''',
    ),
    Habit3(
      createdTime: DateTime.now(),
      title: 'Eat a healthy meal today',
      description: '''- Well balanced meal of carbs, protein and fibre''',
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