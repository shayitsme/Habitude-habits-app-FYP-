import 'package:flutter/cupertino.dart';
import 'package:login_with_signup/widget/habit4_widget.dart';

import 'package:provider/provider.dart';



import '../provider/habits.dart';

import '../provider/habits4.dart';
import 'habit_widget.dart';

class Habit4ListWidget extends StatelessWidget {
  const Habit4ListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<Habits4Provider>(context);
    final habits = provider.habits4;

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
        final habit4 = habits[index];

        return Habit4Widget(habit: habit4);
      },
    );
  }
}
