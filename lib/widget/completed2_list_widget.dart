import 'package:flutter/material.dart';
import 'package:login_with_signup/widget/habit2_widget.dart';
import 'package:provider/provider.dart';

import '../provider/habits2.dart';



class Completed2ListWidget extends StatelessWidget {
  const Completed2ListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<Habits2Provider>(context);
    final habits2 = provider.habits2Completed;

    return habits2.isEmpty
        ? Center(
      child: Text(
        'No completed meditation habits',
        style: TextStyle(fontSize: 20),
      ),
    )

        :ListView.separated(
      physics: BouncingScrollPhysics(),
      padding: EdgeInsets.all(16),
      separatorBuilder: (context, index) => Container(height: 8),
      itemCount: habits2.length,
      itemBuilder: (context, index) {
        final habit2 = habits2[index];

        return Habit2Widget(habit2: habit2);
      },
    );
  }
}
