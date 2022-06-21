import 'package:flutter/cupertino.dart';
import 'package:login_with_signup/models/habit.dart';


class HabitsProvider extends ChangeNotifier {

  List<Habit> _habits = [
    Habit(
      createdTime: DateTime.now(),
      title: "Do my homework",
      description: '''- All my subjects
- Economics
- Coding
- Accounting''',
    ),
    Habit(
      createdTime: DateTime.now(),
      title: 'Study for 2 hours today',
      description: '''- Break every 30 minutes
  - Do not use the phone while studying
''',
    ),
  ];

  List<Habit> get habits =>
      _habits.where((habit) => habit.isDone == false).toList();

  List<Habit> get habitsCompleted =>
      _habits.where((habit) => habit.isDone == true).toList();

  void addHabit(Habit habit) {
    _habits.add(habit);

    notifyListeners();
  }

  void removeHabit(Habit habit) {
    _habits.remove(habit);

    notifyListeners();
  }

  bool toggleHabitStatus(Habit habit) {
    habit.isDone = !habit.isDone;
    notifyListeners();

    return habit.isDone;
  }

  void updateHabit(Habit habit, String title, String description) {
    habit.title = title;
    habit.description = description;

    notifyListeners();
  }
}