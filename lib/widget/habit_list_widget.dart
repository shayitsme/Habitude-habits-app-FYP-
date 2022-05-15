import 'package:flutter/material.dart';

import '../models/habit.dart';
import 'habit_widget.dart';


class HabitListWidget extends StatelessWidget {
  const HabitListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return HabitWidget(
      habit: Habit(
        createdTime: DateTime.now(),
        title: 'Walk the dog', id: ''
      ),
    );
  }
}
