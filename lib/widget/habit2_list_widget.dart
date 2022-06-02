import 'package:flutter/cupertino.dart';


import 'package:provider/provider.dart';


import '../provider/habits2.dart';
import 'habit2_widget.dart';



class Habit2ListWidget extends StatelessWidget {
  const Habit2ListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<Habits2Provider>(context);
    final habits = provider.habit2;

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
        final habit2 = habits[index];

        return Habit2Widget(habit: habit2);
      },
    );
  }
}


