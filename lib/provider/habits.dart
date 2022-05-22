import 'package:flutter/cupertino.dart';
import 'package:login_with_signup/models/habit.dart';


class HabitsProvider extends ChangeNotifier {

  List<Habit> _habits = [
    Habit(
        createdTime: DateTime.now(),
        title: 'Buy some food',
  description: '''- Eggs
- Milk
- Bread
- Water''',
  ),
  Habit(
  createdTime: DateTime.now(),
  title: 'Plan family trip to Norway',
  description: '''- Rent some hotels
- Rent a car
- Pack suitcase''',
  ),
    Habit(
      createdTime: DateTime.now(),
      title: 'Walk the Dog 🐕',
    ),
    Habit(
      createdTime: DateTime.now(),
      title: 'Plan Jacobs birthday party 🎉🥳',
    ),
  ];
  List<Habit> get habits => _habits.where((habit) => habit.isDone == false).toList();
}