import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/habits6.dart';
import 'habit6_widget.dart';



class Completed6ListWidget extends StatelessWidget {
  const Completed6ListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<Habits6Provider>(context);
    final habits6 = provider.habits6Completed;

    return habits6.isEmpty
        ? Center(
      child: Text(
        'No completed self-improvement habits',
        style: TextStyle(fontSize: 20),
      ),
    )

        :ListView.separated(
      physics: BouncingScrollPhysics(),
      padding: EdgeInsets.all(16),
      separatorBuilder: (context, index) => Container(height: 8),
      itemCount: habits6.length,
      itemBuilder: (context, index) {
        final habit6 = habits6[index];

        return Habit6Widget(habit6: habit6);
      },
    );
  }
}