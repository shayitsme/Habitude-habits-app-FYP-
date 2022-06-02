import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:login_with_signup/models/habit4.dart';
import 'package:provider/provider.dart';

import '../provider/habits4.dart';
import '../utils.dart';




class Habit4Widget extends StatelessWidget {
  final Habit4 habit;
  const Habit4Widget({
    Key? key, required this. habit}) : super(key: key);

  @override
  Widget build(BuildContext context) => ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child:Slidable(
    actionPane: SlidableDrawerActionPane(),
    key: Key(habit.id),
    actions: [
      IconSlideAction(
        color: Colors.green,
        onTap: () {},
        caption: 'Edit',
        icon: Icons.edit,
      )
    ],
    secondaryActions: [
      IconSlideAction(
        color: Colors.red,
        caption: 'Delete',
        onTap: () {},
        icon: Icons.delete,
      )
    ],
    child: buildHabit(context),
  ),
  );





  Widget buildHabit(BuildContext context)=>Container(
    color: Colors.white,
    padding: EdgeInsets.all(20),
    child: Row(
      children: [
        Checkbox(
          activeColor: Colors. amber,
          checkColor: Colors.black,
          value: habit. isDone,
          onChanged: (_) {},
        ),
        SizedBox(width: 20),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                habit.title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.amber,
                  fontSize: 22,
                ),
              ),
              if (habit.description.isNotEmpty)
                Container(
                  margin: EdgeInsets.only(top: 4),
                  child: Text(
                    habit.description,
                    style: TextStyle(fontSize: 20, height: 1.5),
                  ),
                )
            ],
          ),
        ),
      ],
    ),
  );

  void deleteHabit4(BuildContext context, Habit4 habit4) {
    final provider = Provider.of<Habits4Provider>(context, listen: false);
    provider.removeHabit4(habit4);

    Utils.showSnackBar(context, 'Habit successfully deleted');
  }

}
