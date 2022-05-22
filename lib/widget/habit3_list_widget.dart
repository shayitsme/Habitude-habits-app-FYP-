import 'package:flutter/cupertino.dart';

import 'package:provider/provider.dart';


import '../provider/habits.dart';

import 'habit_widget.dart';


class Habit3ListWidget extends StatelessWidget {
  const Habit3ListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<HabitsProvider>(context);
    final habits = provider.habits;

    return habits.isEmpty
        ? Center(
      child: Text(
        'No habits',
        style: TextStyle(fontSize: 20),
      ),
    )

        :ListView.separated(
      physics: BouncingScrollPhysics(),
      padding: EdgeInsets.all(16),
      separatorBuilder: (context, index) => Container(height: 8),
      itemCount: habits.length,
      itemBuilder: (context, index) {
        final habit = habits[index];

        return HabitWidget(habit: habit);
      },
    );
  }
}


