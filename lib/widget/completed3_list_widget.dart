import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/habits3.dart';
import 'habit3_widget.dart';



class Completed3ListWidget extends StatelessWidget {
  const Completed3ListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<Habits3Provider>(context);
    final habits3 = provider.habits3Completed;

    return habits3.isEmpty
        ? Center(
      child: Text(
        'No completed diet habits',
        style: TextStyle(fontSize: 20),
      ),
    )

        :ListView.separated(
      physics: BouncingScrollPhysics(),
      padding: EdgeInsets.all(16),
      separatorBuilder: (context, index) => Container(height: 8),
      itemCount: habits3.length,
      itemBuilder: (context, index) {
        final habit3 = habits3[index];

        return Habit3Widget(habit3: habit3);
      },
    );
  }
}