
import 'package:flutter/cupertino.dart';
import 'package:login_with_signup/widget/habit6_widget.dart';

import 'package:provider/provider.dart';
import '../provider/habits6.dart';



class Habit6ListWidget extends StatelessWidget {
  const Habit6ListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<Habits6Provider>(context);
    final habits = provider.habits6;

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
        final habit6 = habits[index];

        return Habit6Widget(habit: habit6);
      },
    );
  }
}

