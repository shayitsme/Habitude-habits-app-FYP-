import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/habits4.dart';
import 'habit4_widget.dart';



class Completed4ListWidget extends StatelessWidget {
  const Completed4ListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<Habits4Provider>(context);
    final habits4 = provider.habits4Completed;

    return habits4.isEmpty
        ? Center(
      child: Text(
        'No completed exercise habits',
        style: TextStyle(fontSize: 20),
      ),
    )

        :ListView.separated(
      physics: BouncingScrollPhysics(),
      padding: EdgeInsets.all(16),
      separatorBuilder: (context, index) => Container(height: 8),
      itemCount: habits4.length,
      itemBuilder: (context, index) {
        final habit4 = habits4[index];

        return Habit4Widget(habit4: habit4);
      },
    );
  }
}