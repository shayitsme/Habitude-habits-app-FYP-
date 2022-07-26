import 'package:flutter/cupertino.dart';


import 'package:login_with_signup/models/habit3.dart';


class Habits3Provider extends ChangeNotifier {

  List<Habit3> _habits3 = [
    Habit3(
      createdTime: DateTime.now(),
      title: 'Did not skip breakfast',
      description: '''Ate before 8.30am
      ''',
    ),
    Habit3(
      createdTime: DateTime.now(),
      title: 'Eat a healthy meal today',
      description: '''Well balanced meal of carbs, protein and fibre''',
    ),
    Habit3(
      createdTime: DateTime.now(),
      title: 'No junk food for the day',
      description: '''Healthy snacks is acceptable''',
    ),
    Habit3(
      createdTime: DateTime.now(),
      title: 'Note calorie intake',
      description: '''Did not binge eat today''',
    ),

  ];
  List<Habit3> get habits3 =>
      _habits3.where((habit3) => habit3.isDone == false).toList();

  List<Habit3> get habits3Completed =>
      _habits3.where((habit3) => habit3.isDone == true).toList();

  void addHabit3(Habit3 habit3) {
    _habits3.add(habit3);

    notifyListeners();
  }

  void removeHabit3(Habit3 habit3) {
    _habits3.remove(habit3);

    notifyListeners();
  }

  bool toggleHabit3Status(Habit3 habit3) {
    habit3.isDone = !habit3.isDone;
    notifyListeners();

    return habit3.isDone;
  }
  void updateHabit3(Habit3 habit3, String title, String description, DateTime createdTime) {
    habit3.title = title;
    habit3.description = description;
    habit3.createdTime = createdTime;

    notifyListeners();
  }
}