
import 'package:flutter/cupertino.dart';
import 'package:login_with_signup/widget/habit5_widget.dart';
import 'package:provider/provider.dart';
import '../provider/habits.dart';
import '../provider/habits5.dart';
import 'habit_widget.dart';

class Habit5ListWidget extends StatelessWidget {
  const Habit5ListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<Habits5Provider>(context);
    final habits = provider.habits5;

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
        final habit5 = habits[index];

        return Habit5Widget(habit5: habit5);
      },
    );
  }
}

