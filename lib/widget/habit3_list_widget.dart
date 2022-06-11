import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import '../provider/habits.dart';
import '../provider/habits3.dart';
import 'habit3_widget.dart';



class Habit3ListWidget extends StatelessWidget {
  const Habit3ListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<Habits3Provider>(context);
    final habits = provider.habits3;

    return habits.isEmpty
        ? Center(
      child: Text(
        'No diet habits',
        style: TextStyle(fontSize: 20),
      ),
    )

        :ListView.separated(
      physics: BouncingScrollPhysics(),
      padding: EdgeInsets.all(16),
      separatorBuilder: (context, index) => Container(height: 8),
      itemCount: habits.length,
      itemBuilder: (context, index) {
        final habit3 = habits[index];

        return Habit3Widget(habit3: habit3);
      },
    );
  }
}


