import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';



import '../models/habit.dart';



class HabitWidget extends StatelessWidget {
  final Habit habit;
  const HabitWidget({
    Key? key, required this. habit,}) : super(key: key);


  @override
  Widget build(BuildContext context) => Slidable(
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
    );


  Widget buildHabit(BuildContext context) => Container(
    color: Colors.white,
    padding: EdgeInsets.all(20),
    child: Row(
      children: [
        Checkbox(
          activeColor: Theme.of(context).primaryColor,
          checkColor: Colors.black,
          value: habit.isDone,
          onChanged: (_) {},
        ),
        const SizedBox(width: 20),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                habit.title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).primaryColor,
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
}
