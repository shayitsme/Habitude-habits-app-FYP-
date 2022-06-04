import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/habits5.dart';
import 'habit5_widget.dart';



class Completed5ListWidget extends StatelessWidget {
  const Completed5ListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<Habits5Provider>(context);
    final habits5 = provider.habits5Completed;

    return habits5.isEmpty
        ? Center(
      child: Text(
        'No completed sleep habits',
        style: TextStyle(fontSize: 20),
      ),
    )

        :ListView.separated(
      physics: BouncingScrollPhysics(),
      padding: EdgeInsets.all(16),
      separatorBuilder: (context, index) => Container(height: 8),
      itemCount: habits5.length,
      itemBuilder: (context, index) {
        final habit5 = habits5[index];

        return Habit5Widget(habit5: habit5);
      },
    );
  }
}