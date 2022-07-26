import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:login_with_signup/models/habit6.dart';
import 'package:provider/provider.dart';

import '../Screens/edit_habit6_page.dart';
import '../provider/habits6.dart';
import '../utils.dart';




class Habit6Widget extends StatelessWidget {
  final Habit6 habit6;
  const Habit6Widget({
    Key? key, required this. habit6}) : super(key: key);

  @override
  Widget build(BuildContext context) => ClipRRect(
    borderRadius: BorderRadius.circular(16),
    child:Slidable(
      actionPane: SlidableDrawerActionPane(),
      key: Key(habit6.id),
      actions: [
        IconSlideAction(
          color: Colors.green,
          onTap: () => editHabit6(context, habit6),
          caption: 'Edit',
          icon: Icons.edit,
        )
      ],
      secondaryActions: [
        IconSlideAction(
          color: Colors.red,
          caption: 'Delete',
          onTap: () => deleteHabit6(context, habit6),
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
          activeColor: Colors. brown[400],
          checkColor: Colors.black,
          value: habit6. isDone,
          onChanged: (_) {
            final provider = Provider.of<Habits6Provider>(context, listen: false);
            final isDone = provider.toggleHabit6Status(habit6);

            Utils.showSnackBar(
              context,
              isDone ? 'Self-improvement habit completed' : 'Self-improvement habit marked incomplete',
            );
          },
        ),
        SizedBox(width: 20),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                habit6.title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.brown[400],
                  fontSize: 22,
                ),
              ),
              if (habit6.description.isNotEmpty)
                Container(
                  margin: EdgeInsets.only(top: 4),
                  child: Text(
                    habit6.description,
                    style: TextStyle(fontSize: 20, height: 1.5),
                  ),
                )
            ],
          ),
        ),
        Utils.setDateText(habit6.createdTime)
      ],
    ),
  );

  void deleteHabit6(BuildContext context, Habit6 habit6) {
    final provider = Provider.of<Habits6Provider>(context, listen: false);
    provider.removeHabit6(habit6);

    Utils.showSnackBar(context, 'Self-improvement habit successfully deleted');
  }
  void editHabit6(BuildContext context, Habit6 habit6) => Navigator.of(context).push(
    MaterialPageRoute(builder: (context) => EditHabit6Page(habit6: habit6),
    ),
  );
}